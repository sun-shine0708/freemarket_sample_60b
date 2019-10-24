class ProductsController < ApplicationController
  before_action :set_parent_category, only: [:new, :create, :edit, :search]
  require "payjp"

  def index
    @categories = Category.roots
    @products = @categories.map{|root| Product.where(category_id: root.subtree)}
    @sorted_products = @products.sort {|a,b| b.length <=> a.length }
    @popular = []
    @sorted_products.each.with_index(1) do |products, i|
      if (i <= 4)
        @popular << products
      else
        break
      end
    end
  end

  def new
    @product = Product.new
    @product.images.build
  end

  def create
    @product = Product.new(product_params)
    if (params[:images] !=nil)
      if @product.save
        params[:images]['url'].each do |image|
        @product.images.create(url: image, product_id: @product.id)
        end
        redirect_to root_path
      else
        redirect_to new_product_path
      end
    else
      redirect_to new_product_path
    end
  end

  def edit
    @product = Product.find(params[:id])
    @category_children_array = [{name:'---', id:'---'}]
    (@product.category.root.children).each do |child|
      @children = {name: child.name, id: child.id}
      @category_children_array << @children
    end
    @category_grandchildren_array = [{name:'---', id:'---'}]
    (@product.category.parent.children).each do |grandchild|
      @grandchildren = {name:grandchild.name, id:grandchild.id}
      @category_grandchildren_array << @grandchildren
    end
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to root_path(@product), notice: '商品を編集しました'
    else
      render :edit
    end
  end
  
  def show
    @product = Product.find(params[:id])
    @seller = @product.seller
    @image = @product.images
    @category = @product.category
    @child = @category.parent
    @parent = @category.root
  end

  def destroy
    @product = Product.find(params[:id])
    if @product.seller_id == current_user.id
      @product.destroy
      redirect_to root_path, notice: '商品を削除しました'
    end
  end

  def buy_confirmation
    @product = Product.find(params[:id])
    @streetaddress = Streetaddress.find_by(user_id: current_user.id)
    card = Creditcard.where(user_id: current_user.id).first
    if card.present?
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @customer_card = customer.cards.retrieve(card.card_id)
    end
  end
        
  def onetimebuy
    @product = Product.find(params[:id])
    @streetaddress = Streetaddress.find_by(user_id: current_user.id)
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    if Payjp::Charge.create(
      amount: @product.price,
      card: params['payjp-token'],
      currency: 'jpy'
      )
      @product.update(buyer_id: current_user.id)
      render template: "creditcards/buy"
    else
      redirect_to action: "buy_confirmation"

    end
  end

  def search
    # 検索オブジェクト作成
    # @search = Product.includes(:category).where(category_id: Category.find(params:id).root.subtree).ransack(params[:q])
    @search = Product.includes(:category).ransack(params[:q])
    # 検索結果表示
    @products = @search.result(distinct: true)
    @namesearchs = Product.where('name LIKE(?)', "%#{params[:keyword]}%").limit(24)
  end

  def get_category_children
    @category_children = Category.find_by(id: "#{params[:parent_id]}", ancestry: nil).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end


  private
  def  product_params
    params.require(:product).permit(:name, :comment, :price, :status, :costcharge, :delivery_way, :delivery_area, :delivery_date, :category_id, :root_category, images_attributes: [:url]).merge(seller_id: current_user.id)
  end

  def set_parent_category
    @category_parent_array = [{name:'---', id:'---'}]
    Category.roots.each do |parent|
      @parent = {name: parent.name, id: parent.id}
      @category_parent_array << @parent
    end
  end
end


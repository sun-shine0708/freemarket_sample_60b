class ProductsController < ApplicationController
before_action :set_parent_category, only: [:new, :create, :edit, :search]

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
    @products = Product.new
    @products.images.build
  end

  def get_category_children
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to root_path(@product), notice: '商品を編集しました'
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    if @product.seller_id == current_user.id
      @product.destroy
      redirect_to root_path, notice: '商品を削除しました'
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

  require "payjp"

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
    @search = Product.includes(:category).ransack(params[:q])
    # 検索結果表示
    @products = @search.result(distinct: true)
  end

  def create
    @products = Product.new(product_params)
    if @products.save
      redirect_to products_path
    else
      render 'new'
    end
  end

  private
  def  product_params
    params.require(:product).permit(:name, :comment, :price, :status, :costcharge, :delivery_way, :delivery_area, :delivery_date, :category_id, :root_category, images_attributes: [:url]).merge(seller_id: current_user.id)
  end

  def set_parent_category
    @category_parent_array = []
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
  end

  # def set_user
  #   @user = User.find(current_user)
  # end
end


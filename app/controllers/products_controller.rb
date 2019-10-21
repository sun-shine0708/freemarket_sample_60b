class ProductsController < ApplicationController
before_action :set_parent_category, only: [:new, :create, :edit]

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

  def edit
    @product = Product.find(params[:id])

    # @category_parent_array = [{name:'---', id:'---'}]
    # Category.roots.each do |parent|
    #   @parent = {name: parent.name, id: parent.id}
    #   @category_parent_array << @parent
    # end
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


  def buy_confirmation
    @product = Product.new
  end

  def create
    @products = Product.new(product_params)
    if @products.save
      redirect_to products_path
    else
      render 'new'
    end
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


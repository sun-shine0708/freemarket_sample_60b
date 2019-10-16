class ProductsController < ApplicationController

  def index

  end

  def new
    @products = Product.new
    @products.images.build
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
  end


  def buy_confirmation
    @products = Product.new
  end

  def create
    @products = Product.new(product_params)
    if @products.save
      render 'index'
    else
      render 'new'
    end
  end

  private
  def  product_params
    params.require(:product).permit(:name, :comment, :price, :status, :costcharge, :delivery_way, :delivery_area, :delivery_date, images_attributes: [:url]).merge(seller_id: current_user.id)
  end

  # def set_user
  #   @user = User.find(current_user)
  # end
end


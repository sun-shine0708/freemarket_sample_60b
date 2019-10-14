class ProductsController < ApplicationController

  
  def index
  end

  def new
    @products = Product.new
    @products.images.build
  end

  def show

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
end


class ProductsController < ApplicationController
  def index
  end

  def new
    @products = Product.new
  end
end

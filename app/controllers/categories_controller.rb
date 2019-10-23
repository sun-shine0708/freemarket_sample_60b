class CategoriesController < ApplicationController
  # before_action :set_parents, [:index, :get_category_children]
  def index
    @parents = Category.where(ancestry: nil).order("id ASC")
  end

  def show
    @category = Category.find(params[:id])
    @products = Product.where(category_id: @category.subtree).order("created_at DESC")
    # binding.pry
    # @products = @categories.map{|root| Product.where(category_id: root.subtree)}
    # @sorted_products = @products.sort {|a,b| b.length <=> a.length }
    # @popular = []
    # @sorted_products.each.with_index(1) do |products, i|
    #   if (i <= 4)
    #     @popular << products
    #   else
    #     break
    #   end
    # end
  end

  def get_category_children
    #子カテゴリーの配列を取得
    @children = Category.find(params[:parent_id]).children.limit(14)
  end

  def get_category_grandchildren
    #孫カテゴリーの配列を取得
    @grandchildren = Category.find(params[:child_id]).children.limit(14)
  end

end

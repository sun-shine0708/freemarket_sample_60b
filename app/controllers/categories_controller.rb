class CategoriesController < ApplicationController
  # before_action :set_parents, [:index, :get_category_children]
  def index
  
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

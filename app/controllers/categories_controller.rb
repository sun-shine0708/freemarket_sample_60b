class CategoriesController < ApplicationController

  def index
    @parents = Category.where(ancestry: nil).order("id ASC").limit(13)
  end
end

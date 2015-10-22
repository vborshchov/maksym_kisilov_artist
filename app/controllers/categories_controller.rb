class CategoriesController < ApplicationController
  require 'unicode'

  # def index
  #   @categories = Category.all.order("name ASC")
  #   @category = Category.all.last
  # end

  def show
    @category = Category.friendly.find(params[:id])
    @artworks = @category.artworks.order("position ASC").page(params[:page]).per(1)
  end

  private
  def categories_params
    params.require(:category).permit(:page)
  end
end

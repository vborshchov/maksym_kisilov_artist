class CategoriesController < ApplicationController
  require 'unicode'

  def show
    @category = Category.friendly.find(params[:id])
    @artworks = Artwork.where(category_id: @category.self_and_descendant_ids).order("position ASC").page(params[:page]).per(params[:per])
  end

  private
  def categories_params
    params.require(:category).permit(:page, :per)
  end
end

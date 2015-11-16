class CategoriesController < ApplicationController
  require 'unicode'

  def show
    if params[:id] == "all"
      @artworks = Artwork.all.order("position ASC").page(params[:page]).per(params[:show])
    else
      @category = Category.friendly.find(params[:id])
      @artworks = Artwork.where(category_id: @category.self_and_descendant_ids).order("position ASC").page(params[:page]).per(params[:show])
    end
  end

  private
  def categories_params
    params.require(:category).permit(:page, :show)
  end
end

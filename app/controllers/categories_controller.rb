class CategoriesController < ApplicationController
  require 'unicode'

  # def show_with_descendants
  #   categories = Category.friendly.find(params[:id]).self_and_descendant_ids
  #   @category = Category.all.last
  # end

  def show
    @category = Category.friendly.find(params[:id])
    if @category.leaf?
      @artworks = @category.artworks.order("position ASC").page(params[:page]).per(params[:per])
    else
      @artworks = Artwork.where(category_id: @category.self_and_descendant_ids).order("position ASC").page(params[:page]).per(params[:per])
    end
  end

  private
  def categories_params
    params.require(:category).permit(:page, :per)
  end
end

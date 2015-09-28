class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @artworks = @category.artworks
  end
end

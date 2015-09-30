class CategoriesController < ApplicationController
  require 'unicode'
  def show
    @category = Category.friendly.find(params[:id])
    @artworks = @category.artworks
  end
end

class CategoriesController < ApplicationController
  require 'unicode'
  def show
    @category = Category.find(params[:id])
    @artworks = @category.artworks
  end
end

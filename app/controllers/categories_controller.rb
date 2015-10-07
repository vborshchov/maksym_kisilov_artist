class CategoriesController < ApplicationController
  require 'unicode'
  def show
    @category = Category.friendly.find(params[:id])
    @artworks = @category.artworks.order("position ASC")
  end
end

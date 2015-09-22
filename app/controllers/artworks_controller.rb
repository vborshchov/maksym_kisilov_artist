class ArtworksController < ApplicationController
  def index
    @artworks = Artworks.all
  end
end

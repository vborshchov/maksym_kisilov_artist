class ArtworksController < ApplicationController

  def index
    @artworks = Artwork.for_main_page
  end

end

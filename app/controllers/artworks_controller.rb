class ArtworksController < ApplicationController
  before_filter :authenticate_admin_user!, only: [:change_position]
  def index
    @artworks = Artwork.for_main_page
  end


  def change_position
    artwork = Artwork.find_by(position: params[:old_index].to_i)
    render text: "Artwork was successfully moved" if artwork.insert_at(params[:new_index].to_i)
  end

  private

    def artwork_params
      params.require(:artwork).permit(:old_index, :new_index)
    end
end

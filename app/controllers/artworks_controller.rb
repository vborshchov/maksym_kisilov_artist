class ArtworksController < ApplicationController
  before_filter :authenticate_admin_user!, only: [:change_position]
  def index
    @artworks = Artwork.for_main_page
  end


  def change_position
    positions_array = Artwork.pluck(:position).sort
    old_position = positions_array[params[:old_index].to_i]
    new_position = positions_array[params[:new_index].to_i]
    artwork = Artwork.find_by(position: old_position.to_f)

    new_position =  if params[:new_index].to_i == 0
                      new_position / 2.0
                    else
                      (new_position + positions_array[params[:new_index].to_i-1].to_f) / 2.0
                    end
    if artwork.update_attributes(position: new_position)
      puts "Hurray!"
      respond_to do |format|
        format.json { render :json => new_position }
      end
    else
      puts "Sorry :("
    end
  end

  private

    def artwork_params
      params.require(:artwork).permit(:position, :old_index, :new_index, :previous_index)
    end
end

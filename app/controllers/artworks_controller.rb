class ArtworksController < ApplicationController
  before_filter :authenticate_admin_user!, only: [:change_position]
  def index
    @artworks = Artwork.for_main_page
  end


  def change_position
    positions = Artwork.pluck(:position).sort
    art_positions_in_category = Category.find_by(slug: params[:category_slug][/(?<=\/)\w+$/]).artworks.pluck(:position).sort
    art_old_position = art_positions_in_category[params[:old_index].to_i]
    art_new_position = art_positions_in_category[params[:new_index].to_i]
    artwork = Artwork.find_by(position: art_old_position.to_f)

    new_position =  if positions.index(art_new_position)-1 == 0
                      art_new_position / 2.0
                    else
                      (art_new_position + positions[params[:new_index].to_i-1].to_f) / 2.0
                    end
    if artwork.update_attributes(position: new_position)
      puts "++++++++++++++++++++++++++++"
      puts "Hurray!"
      puts "++++++++++++++++++++++++++++"
      respond_to do |format|
        format.json { render :json => new_position }
      end
    else
      puts "--------------------------"
      puts "Sorry :("
      puts "--------------------------"
    end
  end

  private

    def artwork_params
      params.require(:artwork).permit(:position, :old_index, :new_index, :previous_index, :category_slug)
    end
end

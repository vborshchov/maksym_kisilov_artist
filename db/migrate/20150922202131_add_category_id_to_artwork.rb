class AddCategoryIdToArtwork < ActiveRecord::Migration
  def change
    add_reference :artworks, :category, index: true, foreign_key: true
  end
end

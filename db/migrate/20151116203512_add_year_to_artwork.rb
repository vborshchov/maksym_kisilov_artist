class AddYearToArtwork < ActiveRecord::Migration
  def up
    Artwork.add_translation_fields! year: :string
  end

  def down
    remove_column :artwork_translations, :year
  end
end

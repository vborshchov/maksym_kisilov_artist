class AddYearToArtworks < ActiveRecord::Migration
  def change
    add_column :artworks, :year, :string
  end
end

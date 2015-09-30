class RemovePaintFromArtworks < ActiveRecord::Migration
  def change
    remove_column :artworks, :paint, :string
  end
end

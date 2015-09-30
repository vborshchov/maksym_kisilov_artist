class AddForMainPageToArtworks < ActiveRecord::Migration
  def change
    add_column :artworks, :for_main_page, :boolean, default: false
  end
end

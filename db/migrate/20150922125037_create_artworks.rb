class CreateArtworks < ActiveRecord::Migration
  def change
    create_table :artworks do |t|
      t.string :name
      t.string :dimension
      t.string :material
      t.string :picture
      t.string :paint

      t.timestamps null: false
    end
  end
end

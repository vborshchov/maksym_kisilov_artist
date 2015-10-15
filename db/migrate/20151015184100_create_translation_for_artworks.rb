class CreateTranslationForArtworks < ActiveRecord::Migration
  def up
    Artwork.create_translation_table!(
      {
        name:      :string,
        material:  :string,
        dimension: :string
      },
      {
        migrate_data: true
      }
    )
  end

  def down
    Artwork.drop_translation_table! migrate_data: true
  end
end

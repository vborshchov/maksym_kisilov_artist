class CreateTranslationForInfos < ActiveRecord::Migration
  def up
    Info.create_translation_table!(
      {
        content:      :string,
      },
      {
        migrate_data: true
      }
    )
  end

  def down
    Info.drop_translation_table! migrate_data: true
  end
end

class CreateInfos < ActiveRecord::Migration
  def change
    create_table :infos do |t|
      t.string :record
      t.text :content

      t.timestamps null: false
    end
  end
end

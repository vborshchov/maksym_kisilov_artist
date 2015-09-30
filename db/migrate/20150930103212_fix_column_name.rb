class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :infos, :record, :page
  end
end

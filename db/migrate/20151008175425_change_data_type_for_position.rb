class ChangeDataTypeForPosition < ActiveRecord::Migration
  def change
    change_table :artworks do |t|
      t.change :position, :integer
    end
  end
end

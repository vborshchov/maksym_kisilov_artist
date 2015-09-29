class AddDefaultValueToArchiveAttribute < ActiveRecord::Migration
  def change
    change_column_default :posts, :archive, false
  end
end

class ChangeDataTypeForInfoTranslations < ActiveRecord::Migration
  def self.up
      change_table :info_translations do |t|
        t.change :content, :text
      end
    end
    def self.down
      change_table :info_translations do |t|
        t.change :content, :string
      end
    end
end

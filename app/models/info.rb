class Info < ActiveRecord::Base
  validates_presence_of :page

  scope :about, -> {where(page: "about").order('id ASC')}
  scope :contacts, -> {where(page: "contacts").order('id ASC')}
end

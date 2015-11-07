# == Schema Information
#
# Table name: infos
#
#  id         :integer          not null, primary key
#  page       :string
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Info < ActiveRecord::Base
  validates_presence_of :page

  translates :content

  scope :about, -> {where(page: "about").order('id ASC')}
  scope :contacts, -> {where(page: "contacts").order('id ASC')}
end

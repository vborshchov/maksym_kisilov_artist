# == Schema Information
#
# Table name: artworks
#
#  id         :integer          not null, primary key
#  name       :string
#  dimension  :string
#  material   :string
#  picture    :string
#  paint      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Artwork < ActiveRecord::Base
  belongs_to :category
  validates_presence_of :name, :category

  mount_uploader :picture, PictureUploader
end

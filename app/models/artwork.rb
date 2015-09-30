# == Schema Information
#
# Table name: artworks
#
#  id          :integer          not null, primary key
#  name        :string
#  dimension   :string
#  material    :string
#  picture     :string
#  paint       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer
#

class Artwork < ActiveRecord::Base
  belongs_to :category
  validates_presence_of :name, :category

  mount_uploader :picture, PictureUploader

  scope :for_main_page, -> { where(for_main_page: true).order('position ASC') }

end

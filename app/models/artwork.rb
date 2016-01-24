# == Schema Information
#
# Table name: artworks
#
#  id            :integer          not null, primary key
#  name          :string
#  dimension     :string
#  material      :string
#  picture       :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  category_id   :integer
#  position      :integer
#  for_main_page :boolean          default(FALSE)
#

class Artwork < ActiveRecord::Base
  belongs_to :category
  validates_presence_of :name, :category

  translates :name, :material, :dimension, :year

  acts_as_list# scope: :category
  paginates_per 40

  mount_uploader :picture, PictureUploader

  default_scope {order("position DESC")}
  scope :for_main_page, -> { where(for_main_page: true).order('position ASC') }

end

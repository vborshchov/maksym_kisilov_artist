# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string
#  position   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  parent_id  :integer
#  slug       :string
#

class Category < ActiveRecord::Base
  extend FriendlyId
  validates_uniqueness_of :name
  friendly_id :name, use: :slugged
  has_many :artworks, -> { order(position: :asc) }
  has_closure_tree order: 'position'

  translates :name


  def normalize_friendly_id(text)
    text.to_slug.normalize(transliterations: :ukrainian).to_s
  end

end

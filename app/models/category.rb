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
#

class Category < ActiveRecord::Base
  has_many :artworks
  has_closure_tree order: 'position'
end

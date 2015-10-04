# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string
#  body       :text
#  archive    :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ActiveRecord::Base
  validates_presence_of :title

  scope :archive, -> { where(archive: true).order('updated_at DESC') }
  scope :current, -> { where(archive: false).order('updated_at DESC') }

end

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

require 'test_helper'

class ArtworkTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

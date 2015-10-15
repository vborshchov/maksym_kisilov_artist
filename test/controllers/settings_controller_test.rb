require 'test_helper'

class SettingsControllerTest < ActionController::TestCase
  test "should get change_locale" do
    get :change_locale
    assert_response :success
  end

end

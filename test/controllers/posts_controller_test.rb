require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  test "should get current" do
    get :current
    assert_response :success
  end

  test "should get archive" do
    get :archive
    assert_response :success
  end

end

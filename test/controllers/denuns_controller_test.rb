require 'test_helper'

class DenunsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get show_all" do
    get :show_all
    assert_response :success
  end

end

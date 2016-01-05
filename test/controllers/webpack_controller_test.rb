require 'test_helper'

class WebpackControllerTest < ActionController::TestCase
  test "should get react_bootstrap" do
    get :react_bootstrap
    assert_response :success
  end

end

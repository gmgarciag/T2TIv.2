require 'test_helper'

class InicioControllerTest < ActionController::TestCase
  test "should get partir" do
    get :partir
    assert_response :success
  end

end

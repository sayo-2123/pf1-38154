require 'test_helper'

class RoomsControllerTest < ActionDispatch::IntegrationTest
  test "should get view" do
    get rooms_view_url
    assert_response :success
  end

end

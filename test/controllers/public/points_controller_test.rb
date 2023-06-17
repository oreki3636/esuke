require "test_helper"

class Public::PointsControllerTest < ActionDispatch::IntegrationTest
  test "should get get" do
    get public_points_get_url
    assert_response :success
  end
end

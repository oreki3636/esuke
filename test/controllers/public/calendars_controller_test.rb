require "test_helper"

class Public::CalendarsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_calendars_new_url
    assert_response :success
  end
end

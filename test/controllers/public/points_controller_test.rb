# frozen_string_literal: true

require 'test_helper'

module Public
  class PointsControllerTest < ActionDispatch::IntegrationTest
    test 'should get get' do
      get public_points_get_url
      assert_response :success
    end
  end
end

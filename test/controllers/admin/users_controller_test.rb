# frozen_string_literal: true

require 'test_helper'

module Admin
  class UsersControllerTest < ActionDispatch::IntegrationTest
    test 'should get show' do
      get admin_users_show_url
      assert_response :success
    end
  end
end

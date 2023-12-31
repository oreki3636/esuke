# frozen_string_literal: true

require 'test_helper'

module Public
  class GroupsControllerTest < ActionDispatch::IntegrationTest
    test 'should get index' do
      get public_groups_index_url
      assert_response :success
    end

    test 'should get show' do
      get public_groups_show_url
      assert_response :success
    end

    test 'should get new' do
      get public_groups_new_url
      assert_response :success
    end
  end
end

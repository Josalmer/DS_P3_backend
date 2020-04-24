# frozen_string_literal: true

require 'test_helper'
require_relative '../../../helpers/setup_helper'

class Api::V1::UserProfilesControllerTest < ActionDispatch::IntegrationTest
  include SetupHelper

  def setup
    setup_user_one
  end

  test 'success when getting user profile' do
    get '/api/v1/user_profile', headers: @json_headers
    assert_response :success
  end

  test 'success when updating user profile' do
    patch '/api/v1/user_profile', as: :json, headers: @json_headers, params: { name: 'test' }
    assert_response :success
  end
end

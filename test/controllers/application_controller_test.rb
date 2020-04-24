# frozen_string_literal: true

require 'test_helper'

class ApplicationControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test 'admin can access to admin' do
    user = users(:adminUser)
    sign_in user
    get '/admin'
    assert_response :success
  end

  test 'user can not access to admin' do
    user = users(:one)
    sign_in user
    get '/admin'
    assert_response 302
  end
end

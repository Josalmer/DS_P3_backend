# frozen_string_literal: true

require 'test_helper'

class Api::V1::RegistrationsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @json_headers = { "Accept": 'application/json', "Content-Type": 'application/json' }
  end

  test 'success when creating new user' do
    post '/api/v1/users', as: :json, headers: @json_headers, params: {
      api_v1_user: {
        password: '123456',
        email: 'test@mail.com'
      }
    }
    assert_response :success
  end

  test 'error when creating new user and some field is wrong' do
    post '/api/v1/users', as: :json, headers: @json_headers, params: {
      api_v1_user: {
        password: '123456',
        email: 'wrong_mail'
      }
    }
    assert_response :not_acceptable
  end
end

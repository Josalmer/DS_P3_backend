# frozen_string_literal: true

require 'simplecov'

SimpleCov.start 'rails' do
  ENV['RAILS_ENV'] ||= 'test'

  add_filter 'app/models/concerns/attachable.rb'
  add_filter 'app/controllers/api/v1/passwords_controller.rb'
end

require_relative 'helpers/authorization_helper'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  include AuthorizationHelper
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def json_response
    JSON.parse(response.body)
  end
end

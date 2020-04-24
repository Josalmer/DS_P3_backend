# frozen_string_literal: true

class Api::BaseController < ActionController::API
  before_action :authenticate_api_v1_user!
end

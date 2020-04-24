# frozen_string_literal: true

class Api::V1::SessionsController < ::Devise::SessionsController
  respond_to :json
  skip_forgery_protection
  before_action :authenticate_api_v1_user!, except: [:create]

  def create
    self.resource = warden.authenticate!(auth_options)
    sign_in(resource_name, resource)
    render json: { success: true, auth_token: current_token, email: resource.email }
  end

  private

  def current_token
    request.env['warden-jwt_auth.token']
  end

  def respond_to_on_destroy
    head :no_content
  end
end

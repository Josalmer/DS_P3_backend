# frozen_string_literal: true

class Api::V1::RegistrationsController < ::Devise::RegistrationsController
  respond_to :json
  skip_forgery_protection
  before_action :authenticate_api_v1_user!, except: [:create]

  def create
    user = User.new(user_params)

    if user.save
      render json: { success: true, email: user.email }
    else
      render json: user.errors, status: :not_acceptable
    end
  end

  private

  def user_params
    params[:api_v1_user].permit(:email, :name, :surname, :password)
  end
end

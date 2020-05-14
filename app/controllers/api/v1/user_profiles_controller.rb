# frozen_string_literal: true

class Api::V1::UserProfilesController < Api::BaseController
  def show
    @user = current_api_v1_user
  end

  def update
    current_api_v1_user.update_attributes(user_params) unless user_params.empty?
    @user = current_api_v1_user
  end

  private

  def user_params
    params.permit(:email, :name, :surname, :password)
  end
end

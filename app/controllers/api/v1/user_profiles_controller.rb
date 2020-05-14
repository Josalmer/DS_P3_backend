# frozen_string_literal: true

class Api::V1::UserProfilesController < Api::BaseController
  def show
    @user = current_api_v1_user
  end

  def update
    current_api_v1_user.update_attributes(user_params) unless user_params.empty?
    @user = current_api_v1_user
  end

  def add_cash
    @user = current_api_v1_user
    recharge = recharge_params['recharge']
    if CashAdded.create(user_id: @user.id, charge: recharge)
      @user.money += recharge
      @user
    else
      head 500
    end
  end

  private

  def user_params
    params.permit(:email, :name, :surname, :password)
  end

  def recharge_params
    params.permit(:recharge)
  end
end

# frozen_string_literal: true

class Api::V1::PasswordsController < ::Devise::PasswordsController
  respond_to :json
  skip_forgery_protection

  protected

  def after_resetting_password_path_for(_resource)
    successful_changed_password_path
  end
end

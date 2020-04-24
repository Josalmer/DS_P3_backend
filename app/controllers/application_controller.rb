# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    sign_out current_user
    redirect_to new_session_path(User), alert: exception.message
  end
end

require 'json_web_token'

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
  def is_admin?
    current_user && current_user.admin?
  end

  def verify_jwt_token
    head :unauthorized if request.headers['Authorization'].nil? ||
    !JsonWebToken.valid?(request.headers['Authorization'].split(' ').last)
  end
end

require 'json_web_token'

class Api::SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    resource = User.find_for_database_authentication(
      email: params[:user][:email]
    )

    if resource.valid_password? params[:user][:password]
      token = JsonWebToken.issue_token(resource)
      sign_in :user, resource
      render json: { user: resource, token: token }
    else
      render json: ['nope'], status: 422
    end
  end

  def destroy
    if sign_out
      render json: {}
    else
      render json: 'wtf', status: 422
    end
  end

  def signed_in
    if current_user
      render json: {signed_in: true}
    else
      render json: {signed_in: false}
    end
  end
end

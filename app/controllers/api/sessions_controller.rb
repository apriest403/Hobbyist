class Api::SessionsController < ApplicationController
  def create
    resource = User.find_for_database_authentication(
      email: params[:user][:email]
    )
    if resource.valid_password? params[:user][:password]
      sign_in :user, resource
      render json: resource
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
      render json: 'You are signed in :D'
    else
      render json: 'You are not signed in :('
    end
  end
end

class Api::UsersController < ApplicationController
  before_action :verify_jwt_token
  
  def show
    @user = User.find(params[:id])
    render :show
  end
end

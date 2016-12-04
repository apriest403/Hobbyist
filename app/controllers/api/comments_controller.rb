class Api::CommentsController < ApplicationController
    skip_before_action :verify_authenticity_token

  def show
    @comment = Comment.includes(:user).find(params[:id])
    render json: @comment
  end
end

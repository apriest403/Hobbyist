class Api::CommentsController < ApplicationController
  def show
    @comment = Comment.includes(:user).find(params[:id])
    render json: @comment
  end
end

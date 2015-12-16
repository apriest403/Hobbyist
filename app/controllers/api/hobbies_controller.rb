class Api::HobbiesController < ApplicationController
  def index
    @hobbies = Hobby.all
    render json: @hobbies
  end

  def show
    @user = current_or_guest_user
    @hobby = Hobby.includes(:posts, posts: :votes).find(params[:id])
    @posts = @hobby.posts.all

    render json: {user: @user, hobby: @hobby, posts: @posts }
  end
end

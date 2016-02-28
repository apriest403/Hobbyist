class Api::HobbiesController < ApplicationController
  def index
    @hobbies = Hobby.all
    render json: @hobbies
  end

  def create
    @hobby = Hobby.new(hobby_params)
    if @hobby.save
      render json: @hobby
    else
      render json: @hobby.errors.full_messages
    end
  end

  def show
    @user = current_user
    @hobby = Hobby.includes(:posts, posts: :votes).find(params[:id])
    @posts = @hobby.posts.all

    render json: {user: @user, hobby: @hobby, posts: @posts }
  end

  def update
    if is_admin?
      @hobby = Hobby.find(params[:id])
      if @hobby.update(hobby_params)
        render json: @hobby
      else
        render json: @hobby.errors.full_messages, status: 422
      end
    else
      render json: {'Things you can do' => 'not this'}, status: 422
    end
  end

  def destroy
    if is_admin?
      @hobby = Hobby.find(params[:id])
      if @hobby.destroy
        render json: @hobby
      else
        render json: @hobby.errors.full_messages, status: 422
      end
    else
      render json: {'Things you can do' => 'not this'}, status: 422
    end
  end

  private

  def hobby_params
    params.require(:hobby).permit(:name, :description)
  end
end

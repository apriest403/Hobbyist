class HobbiesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_hobby,    only: [:show, :edit, :update, :destroy]
  before_filter :verify_admin, only: [:edit, :update, :destroy]

  respond_to :html

  def index
    @hobbies = Hobby.all
  end

  def show
    @user = current_or_guest_user
    @hobby = Hobby.includes(:posts, posts: :votes).find(params[:id])
    @posts = @hobby.posts.all
  end

  def new
    @hobby = Hobby.new
    respond_with(@hobby)
  end

  def edit

  end

  def create
    @hobby = Hobby.new(hobby_params)
    @hobby.save
    respond_with(@hobby)
  end

  def update
    @hobby.update(hobby_params)
    respond_with(@hobby)
  end

  def destroy
    @hobby.destroy
    respond_with(@hobby)
  end

  private
    def is_guest
      current_user && session[:guest_user_id] == current_user.id 
    end

    def set_hobby
      @hobby = Hobby.find(params[:id])
    end

    def hobby_params
      params.require(:hobby).permit(:name, :description)
    end

    def verify_admin
      unless current_or_guest_user.admin?
        flash[:danger] = "You can't edit hobbies unless you're an admin"
        redirect_to root_path
      end
    end
end

class HobbiesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_hobby, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @hobbies = Hobby.all
    respond_with(@hobbies)
  end

  def show
    @user = current_user
    # respond_with(@hobby)
    @hobby = Hobby.find(params[:id])
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
    def set_hobby
      @hobby = Hobby.find(params[:id])
    end

    def hobby_params
      params.require(:hobby).permit(:name, :description)
    end
end

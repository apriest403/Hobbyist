class UserHobbiesController < ApplicationController 
  def create
    hobby = Hobby.find(params[:hobby_id])
    current_user.follow(hobby)
    flash[:success] = "Followed #{hobby.name}!"
    redirect_to hobby
  end

  def destroy
    hobby = UserHobby.find(params[:id]).hobby
    current_user.unfollow(hobby)
    flash[:success] = "Unfollowed #{hobby.name}!"
    redirect_to root_path
  end
end

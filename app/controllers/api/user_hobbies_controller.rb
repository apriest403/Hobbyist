class Api::UserHobbiesController < ApplicationController
  def create
    hobby = Hobby.find(params[:hobby_id])
    
    if !current_user || !hobby
      render json: false 
    else
      render json: current_user.follow(hobby)
    end
  end

  def destroy
    hobby = Hobby.find(params[:hobby_id])

    if !current_user || !hobby || !current_user.has_hobby?(hobby)
      render json: false 
    else
      render json: current_user.unfollow(hobby)
    end
  end
end
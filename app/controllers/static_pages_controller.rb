class StaticPagesController < ApplicationController
  def index
    if user_signed_in?
      @user = current_or_guest_user
      @hobbies = User.includes(:hobbies).find(@user.id).hobbies.paginate(page: params[:page])
    end
  end
  
  def help
  end
  
  def about
  end
end

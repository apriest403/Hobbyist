class StaticPagesController < ApplicationController
  def index
    if user_signed_in?
      @user = current_user
      @hobbies = @user.hobbies.paginate(page: params[:page])
    end
  end
  
  def help
  end
  
  def about
  end

  def fail_page

    fail
  end
end

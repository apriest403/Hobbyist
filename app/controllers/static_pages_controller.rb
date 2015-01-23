class StaticPagesController < ApplicationController
  def index
        @title = "Hobbies"
        @user = current_user
        @hobbies = @user.hobbies.paginate(page: params[:page])
        render 'show_hobbies'
  end
  
  def help
  end
  
  def about
  end

end

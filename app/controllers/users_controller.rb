class UsersController < ApplicationController
	before_action :authenticate_user!

	def show
		@user = User.find(params[:id])
	end

	def index
		@users = User.all
		# respond_with(@users)
	end

	def following
		@title = "Following"
		@user = User.find(params[:id])
		@users = @user.following.paginate(page: params[:page])
		render 'show_follow'
	end

	def followers
		@title = "Followers"
		@user = User.find(params[:id])
		@users = @user.followed.paginate(page: params[:page])
		render 'show_follow'
	end

end
class UsersController < ApplicationController
	# before_action :authenticate_user!

	def show
		@user = User.find(params[:id])
	end

	def index
		@users = User.all
		# respond_with(@users)
	end

end
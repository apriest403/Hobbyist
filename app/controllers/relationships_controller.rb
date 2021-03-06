class RelationshipsController < ApplicationController
	before_action :authenticate_user!

	def create
		@user = User.find(params[:followed_id])
		current_user.follow_user(@user)
		respond_to do |format|
			format.html {redirect_to @user}
			format.js
		end
	end

	def destroy
		@user = Relationship.find(params[:id]).followed
		current_user.unfollow_user(@user)
		respond_to do |format|
			format.html {redirect_to @user}
			format.js
		end
	end

end

require 'test_helper'

class UsersControllerTest < ActionController::TestCase

	def setup
		@draco = users(:draco)
		@harry = users(:harry)
	end

	test "should redirect index when not logged in" do
		get :index
		assert_redirected_to new_user_session_path
	end

	test "should redirect following when no logged in" do
		get :following, id: @draco
		assert_redirected_to new_user_session_path
	end

	test "should redirect followers when no logged in" do
		get :followers, id: @draco
		assert_redirected_to new_user_session_path
	end

end
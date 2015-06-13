require 'test_helper'

class FollowingTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
	def setup
	  @user = users(:harry)
	end

	test "user following page" do
		get following_user_path(@user)
		assert_not @user.following.empty?
		# assert_match @user.following.count.to_s, response.body
		# @user.following.each do |user|
		# 	assert_select "a[href=?]", user_path(user)
		# end
	end

	test "user followers page" do
		get followers_user_path(@user)
		assert_not @user.followers.empty?
		# assert_match @user.followers.count.to_s, response.body
		# @user.following.each do |user|
		# 	assert_select "a[href=?]", user_path(user)
		# end
	end

end

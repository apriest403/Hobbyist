require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
  	@post = posts(:winning)
  end

  test "should redirect when not logged in" do
  	assert_no_difference 'Post.count' do
  		post :create, post: {title: "nope", content: "hmmm"}
  	end
  	assert_redirected_to new_user_session_path
  end


end

require 'test_helper'

class UserHobbiesControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
  	@hobby = hobbies(:cooking)
    @user = User.create(name: "Sam", email: "lol@example.com", password: "password", password_confirmation: "password")
  end


  test "should create UserHobby relationship" do
  	# assert_difference 'UserHobby.count' do
  	# 	post :create, user_hobbies(:user_hobby_1)
  	# end
  end

end

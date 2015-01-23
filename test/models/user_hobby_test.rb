require 'test_helper'

class UserHobbyTest < ActiveSupport::TestCase

  def setup
    @user_hobby = UserHobby.new(user_id: 1, hobby_id: 2)
  end
  
  test "should be valid" do
    assert @user_hobby.valid?
  end
  
  test "should require a user_id" do
    @user_hobby.user_id = nil
    assert_not @user_hobby.valid?
  end
  
  test "should require a hobby_id" do
    @user_hobby.hobby_id = nil
    assert_not @user_hobby.valid?
  end
  
end

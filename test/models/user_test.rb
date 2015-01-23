require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @hobby = Hobby.create(name: "Baseball", description: "Steroids")
    @user = User.create(name: "Sam", email: "lol@example.com", password: "password", 
                    password_confirmation: "password")
  end

  test "should follow and unfollow a hobby" do
    assert_not @user.has_hobby?(@hobby)
    @user.follow(@hobby)
    assert @user.has_hobby?(@hobby)
    assert @hobby.users.include?(@user)
    @user.unfollow(@hobby)
    assert_not @user.has_hobby?(@hobby)
  end

end

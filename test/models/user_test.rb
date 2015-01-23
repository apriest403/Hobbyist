require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @hobby = Hobby.new(name: "Baseball", description: "Steroids")
    @user = User.new(name: "Sam", email: "lol@example.com", password: "password", 
                    password_confirmation: "password")
  end

  test "should follow and unfollow a hobby" do
    assert_not @user.has_hobby?(@hobby)
  end

end

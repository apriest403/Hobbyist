require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "should follow and unfollow a hobby" do
    baseball = hobbies(:baseball)
    draco = users(:draco)
    harry = users(:harry)

    assert_not draco.has_hobby?(baseball)
    draco.follow(baseball)
    assert draco.has_hobby?(baseball)
    assert baseball.users.include?(draco)
    draco.unfollow(baseball)
    assert_not draco.has_hobby?(baseball)
  end

  test "should follow and unfollow a user" do 
    draco = users(:draco)
    harry = users(:harry)

    assert_not draco.followingUser?(harry)
    draco.followUser(harry)
    assert draco.followingUser?(harry)
    draco.unfollowUser(harry)
    assert_not draco.followingUser?(harry)
  end

end

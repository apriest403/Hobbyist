# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime
#  updated_at             :datetime
#  name                   :string
#  admin                  :boolean          default(FALSE)
#

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

    assert_not draco.following_user?(harry)
    draco.follow_user(harry)
    assert draco.following_user?(harry)
    draco.unfollow_user(harry)
    assert_not draco.following_user?(harry)
  end

end

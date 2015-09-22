# == Schema Information
#
# Table name: user_hobbies
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  hobby_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class UserHobbyTest < ActiveSupport::TestCase

  def setup
    @user_hobby = UserHobby.new(user_id: 1, hobby_id: 2)
    @user_hobby_2 = UserHobby.new(user_id: 3, hobby_id: 3)
  end
  
  test "should be valid" do
    assert @user_hobby.valid?
    assert @user_hobby_2.valid?
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

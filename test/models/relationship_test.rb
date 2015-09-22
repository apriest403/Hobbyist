# == Schema Information
#
# Table name: relationships
#
#  id          :integer          not null, primary key
#  follower_id :integer
#  followed_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class RelationshipTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
  	@relationship = relationships(:three)
  end

  test "relationship should be valid" do
  	assert @relationship.valid?
  end

  test "relationship should require a follower_id" do
  	@relationship.follower_id = nil
  	assert_not @relationship.valid?
  end

  test "relationship should require a followed_id" do
  	@relationship.followed_id = nil
  	assert_not @relationship.valid?
  end

end

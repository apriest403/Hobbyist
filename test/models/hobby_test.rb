# == Schema Information
#
# Table name: hobbies
#
#  id          :integer          not null, primary key
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  description :text
#

require 'test_helper'

class HobbyTest < ActiveSupport::TestCase

	def setup
	    @hobby = hobbies(:baseball)
	    @user = users(:draco)
	    @post = posts(:winning)
  	end
  
  	test "hobby should be valid" do
    	assert @hobby.valid?
  	end

  	test "hobby should have a name" do
  		@hobby.name = nil
  		assert_not @hobby.valid?
  	end

end

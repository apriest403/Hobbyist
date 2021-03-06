require 'test_helper'

class RelationshipsControllerTest < ActionController::TestCase

	test "Relationships: create should require logged-in-user" do
	  	assert_no_difference 'Relationship.count' do
	  		post :create
	  	end
	  	assert_redirected_to new_user_session_path
  end

	test "Relationships: destroy should require a logged-in-user" do
		assert_no_difference 'Relationship.count' do
	  		delete :destroy, id: relationships(:one)
		end
		assert_redirected_to new_user_session_path
  end

end

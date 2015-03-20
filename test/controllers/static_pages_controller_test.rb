require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_select "title", "Hobbyist"
    assert_response :success 
  end
  
  test "should get help" do
    get :help
    assert_select "title", "Help | Hobbyist"
    assert_response :success
  end
  
  test "should get about" do
    get :about
    assert_select "title", "About | Hobbyist"
    assert_response :success
  end

end

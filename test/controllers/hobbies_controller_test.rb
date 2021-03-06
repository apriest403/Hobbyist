require 'test_helper'

class HobbiesControllerTest < ActionController::TestCase
  def setup
    @cooking = hobbies(:cooking)
    @baseball = hobbies(:baseball)
    @user = User.create(name: "Sam", email: "lol@example.com", password: "password", password_confirmation: "password")
  end

  test "should get index" do
    sign_in @user
    get :index
    assert_response :success
    assert_not_nil assigns(:hobbies)
  end

  test "should get new" do
    sign_in @user
    get :new
    assert_response :success
  end

  test "should create hobby" do
    sign_in @user
    assert_difference('Hobby.count') do
      post :create, hobby: { name: @cooking.name }
    end

    assert_redirected_to hobby_path(assigns(:hobby))
  end

  test "should show hobby" do
    sign_in @user
    get :show, id: @cooking.id
    assert_response :success
  end

  test "should get edit" do
    sign_in @user
    # get :edit, id: @cooking
    # assert_response :success
  end

  test "should update hobby" do
    # sign_in @user
    # patch :update, id: @cooking.id, hobby: { name: @cooking.name }
    # assert_redirected_to hobby_path(assigns(:hobby))
  end

  test "should destroy hobby" do
    # sign_in @user
    # assert_difference('Hobby.count', -1) do
    #   delete :destroy, id: @cooking
    # end

    # assert_redirected_to hobbies_path
  end
end

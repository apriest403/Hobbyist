require 'test_helper'

class PostTest < ActiveSupport::TestCase

  def setup
    @hobby = Hobby.create(name: "Baseball", description: "Steroids")
    @user = User.create(name: "Sam", email: "lol@example.com", password: "password", 
                    password_confirmation: "password")
    @post = Post.new(       title: "Title", 
                            link: "http://usuck.com",
                            content: "U suck :(", 
                            user_id: @user.id,
                            hobby_id: @hobby.id)
  end
  
  test "should be valid" do
    assert @post.valid?
  end
  
  test "user id should be present" do
    @post.user_id = nil
    assert_not @post.valid?
  end
  
  test "hobby id should be present" do
    @post.hobby_id = nil
    assert_not @post.valid?
  end
  
  test "title should be present" do
    @post.title = "   "
    assert_not @post.valid?
  end
  
  test "link should not be more than 255 chars" do
    @post.link = "f"*256
    assert_not @post.valid?
  end
  
  test "content should be present" do
    @post.content = "   "
    assert_not @post.valid?
  end
  
  
end

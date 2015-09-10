class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :user_hobbies, dependent: :destroy
  has_many :hobbies, :through => :user_hobbies
  has_many :posts, dependent: :destroy
  
  has_many :active_relationships, class_name:   "Relationship",
                                  foreign_key:  "follower_id",
                                  dependent:    :destroy

  has_many :passive_relationships, class_name:   "Relationship",
                                   foreign_key:  "followed_id",
                                   dependent:    :destroy 

  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships

  # Follows a hobby
  def follow(some_hobby)
    user_hobbies.create(hobby_id: some_hobby.id)
  end
  
  # Unfollows a hobby
  def unfollow(some_hobby)
    user_hobbies.find_by(hobby_id: some_hobby.id).destroy
  end
  
  # Returns true if user is following the hobby
  def has_hobby?(some_hobby)
    hobbies.include?(some_hobby)
  end

  # Follows a user
  def follow_user(other_user)
    active_relationships.create(followed_id: other_user.id)
  end

  # Unfollows a user
  def unfollow_user(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  # Returns true if the current user is following the other user
  def following_user?(other_user)
    following.include?(other_user)
  end
end
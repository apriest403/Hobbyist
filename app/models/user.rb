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

  has_many :comments

  # Follows a hobby
  def follow(some_hobby)
    user_hobbies.create(user_id: id, hobby_id: some_hobby.id)
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

  def is_guest? 
    current_user && session[:guest_user_id] == current_user.id 
  end
end

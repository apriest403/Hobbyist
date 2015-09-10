class Hobby < ActiveRecord::Base
  validates :name, presence: true

  has_many :user_hobbies
  has_many :users, :through => :user_hobbies
  has_many :posts
end

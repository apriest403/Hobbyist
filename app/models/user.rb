class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :user_hobbies, dependent: :destroy
  has_many :hobbies, :through => :user_hobbies
  
  def follow(some_hobby)
    user_hobbies.create(hobby_id: some_hobby.id)
  end
  
  def unfollow(some_hobby)
    user_hobbies.find_by(hobby_id: some_hobby.id).destroy
  end
  
  def has_hobby?(some_hobby)
    hobbies.include?(some_hobby)
  end
  
end
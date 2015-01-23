class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :user_hobbies
  has_many :hobbies, :through => :user_hobbies
  
  def has_hobby?(some_hobby)
    hobbies.include?(some_hobby)
  end
  
end

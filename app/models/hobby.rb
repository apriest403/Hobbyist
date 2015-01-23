class Hobby < ActiveRecord::Base
    has_many :user_hobbies
    has_many :users, :through => :user_hobbies
end

class UserHobby < ActiveRecord::Base
    belongs_to :user
    belongs_to :hobby
    validates :user_id,  presence: true
    validates :hobby_id, presence: true, uniqueness: { scope: :user_id }
end

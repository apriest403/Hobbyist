# == Schema Information
#
# Table name: user_hobbies
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  hobby_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class UserHobby < ActiveRecord::Base
    belongs_to :user
    belongs_to :hobby
    validates :user_id,  presence: true
    validates :hobby_id, presence: true, uniqueness: { scope: :user_id }
end

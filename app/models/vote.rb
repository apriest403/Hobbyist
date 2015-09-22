# == Schema Information
#
# Table name: votes
#
#  id           :integer          not null, primary key
#  votable_id   :integer          not null
#  votable_type :string           not null
#  value        :integer          not null
#  user_id      :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Vote < ActiveRecord::Base
  validates :votable_id, :votable_type, :value, :user_id, presence: true
  validates :votable_id, uniqueness: { scope: [:user_id, :votable_type] }

  belongs_to :user
  belongs_to :votable, polymorphic: true
end

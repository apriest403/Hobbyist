# == Schema Information
#
# Table name: hobbies
#
#  id          :integer          not null, primary key
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  description :text
#

class Hobby < ActiveRecord::Base
  validates :name, presence: true

  has_many :user_hobbies
  has_many :users, :through => :user_hobbies
  has_many :posts

  def self.find_by_name(name)
    Hobby.find_by("lower(name) = ?", name.downcase)
  end
end

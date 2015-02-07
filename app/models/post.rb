class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :hobby
  validates :user_id, presence: true
  validates :hobby_id, presence: true
  validates :title, presence: true
  validates :link, length: {maximum: 255}
  validates :content, presence: true
end

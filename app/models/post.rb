class Post < ActiveRecord::Base
  validates :user_id,   presence: true
  validates :hobby_id,  presence: true
  validates :title,     presence: true
  validates :content,   presence: true
  validates :link,      length: { maximum: 255 }

  belongs_to :user
  belongs_to :hobby
end

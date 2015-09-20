class Post < ActiveRecord::Base
  validates :user_id,   presence: true
  validates :hobby_id,  presence: true
  validates :title,     presence: true
  validates :content,   presence: true
  validates :link,      length: { maximum: 255 }

  belongs_to :user
  belongs_to :hobby

  has_many   :comments

  def comments_by_parent_id
    comment_layers = Hash.new { |h, k| h[k] = [] }
    comments.each do |comment|
      comment_layers[comment.parent_comment_id] << comment
    end
    comment_layers
  end
end

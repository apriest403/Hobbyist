# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string
#  link       :text
#  content    :string
#  user_id    :integer
#  hobby_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ActiveRecord::Base
  validates :user_id,   presence: true
  validates :hobby_id,  presence: true
  validates :title,     presence: true
  validates :content,   presence: true
  validates :link,      length: { maximum: 255 }

  belongs_to :user
  belongs_to :hobby
  has_many   :comments
  has_many   :votes, as: :votable, dependent: :destroy

  def comments_by_parent_id
    comment_layers = Hash.new { |h, k| h[k] = [] }
    comments.each do |comment|
      comment_layers[comment.parent_comment_id] << comment
    end
    comment_layers
  end

  def score
    # votes = Vote.where(votable_type: "Post", votable_id: id)
    votes.inject(0) {|accum, elem| accum += elem.value }
  end
end

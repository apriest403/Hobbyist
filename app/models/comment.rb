# == Schema Information
#
# Table name: comments
#
#  id                :integer          not null, primary key
#  content           :text             not null
#  user_id           :integer          not null
#  post_id           :integer          not null
#  parent_comment_id :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Comment < ActiveRecord::Base
  validates :content, :user_id, :post_id, presence: true
  belongs_to :user
  belongs_to :post

  belongs_to :parent_comment,
    class_name:  "Comment",
    foreign_key: :parent_comment_id,
    primary_key: :id

  has_many :child_comments,
    class_name:  "Comment",
    foreign_key: :parent_comment_id,
    primary_key: :id
end

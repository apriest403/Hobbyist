module CommentsHelper
  def user_owns?(comment)
    comment.user_id == current_user.id
  end
end

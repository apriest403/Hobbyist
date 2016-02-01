module CommentsHelper
  def user_owns?(comment)
    current_user && comment.user_id == current_user.id
  end
end

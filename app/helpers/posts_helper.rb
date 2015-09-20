module PostsHelper
  def append_http(link)
    if link.include?("http://") 
      link 
    else
      "http://" + link
    end
  end

  def owns_post?(post)
    post.user_id == current_user.id
  end
end

class Api::PostsController < ApplicationController
  def show
    @post = Post.includes(:user).find(params[:id])
    @all_comments = @post.comments_by_parent_id
    render json: {post: @posts, all_comments: @all_comments}
  end
end

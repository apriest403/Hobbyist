class Api::PostsController < ApplicationController
  def create
    @post = current_user.posts.new(posts_params)

    if @post.save
      render json: @post
    else
      render json: @post.errors.full_messages, status: 422
    end
  end

  def update
    @post = Post.find(params[:id])

    if current_user.id == @post.user_id && @post.update(post_params)
      render json: @post
    else
      render @post.errors.full_messages, status: 422
    end
  end

  def show
    @post = Post.includes(:user).find(params[:id])
    @all_comments = @post.comments_by_parent_id
    render json: {post: @posts, all_comments: @all_comments}
  end

  private
  def post_params
    params.require(:post).permit(:title, :link, :content, :hobby_id)
  end
end

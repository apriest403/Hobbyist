class PostsController < ApplicationController
before_action :authenticate_user!, except: [:show]
# skip_before_filter :verify_authenticity_token, :only => [:is_guest?]

  def new
    @hobbies = current_or_guest_user.hobbies.all.map do |hobby| 
      [hobby.name, hobby.id]
    end
    
    @post = current_or_guest_user.posts.build

  end

  def create
    @hobbies = current_or_guest_user.hobbies.all
    @post = current_or_guest_user.posts.new(post_params)

    if @post.save 
      flash[:success] = "Post successful!"
      redirect_to hobbies_path
    else
      flash[:danger] = "Try again!"
      redirect_to hobbies_path
    end
  end

  def show
    @post = Post.includes(:comments).find(params[:id])
    @comment = Comment.new
    @all_comments = @post.comments_by_parent_id
  end

  private
  def guest

  end

  def post_params
    params.require(:post).permit(:title, :link, :content, :hobby_id)
  end
end
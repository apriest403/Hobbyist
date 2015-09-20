class PostsController < ApplicationController
before_action :authenticate_user!, except: [:show]

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
      redirect_to post_url(@post)
    else
      flash[:danger] = @post.errors.full_messages
      redirect_to new_post_url
    end
  end

  def show
    @post = Post.includes(:user).find(params[:id])
    @all_comments = @post.comments_by_parent_id
  end

  def edit
    @post = Post.find(params[:id])
    render :edit
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:success] = "Post successfully updated!"
      redirect_to post_url(@post)
    else
      flash[:danger] = @post.errors.full_messages
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to hobby_url(@post.hobby_id)
  end

  private
  def guest

  end

  def post_params
    params.require(:post).permit(:title, :link, :content, :hobby_id)
  end
end
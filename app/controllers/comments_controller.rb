class CommentsController < ApplicationController
  def show
    @comment = Comment.includes(:user).find(params[:id])
    render :show
  end

  def edit
    @comment = Comment.includes(:post).find(params[:id])
    render :edit
  end

  def update 
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      flash[:success] = "Successfully edited comment!"
      redirect_to post_url(@comment.post_id)
    else
      @comment = Comment.find(params[:id])
      render :edit
    end
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      flash[:success] = "Successfully added comment!"
    end
    redirect_to post_url(@comment.post_id)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to post_url(@comment.post_id)
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :post_id, :parent_comment_id)
  end
end

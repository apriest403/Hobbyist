class PostsController < ApplicationController
    def new
        @post = current_user.posts.build
    end
    
    def create
        @hobby = Hobby.find_by(params[:id])
        @post = current_user.posts.new(post_params)
        if @post.save 
            flash[:success] = "Post successful!"
            redirect_to root
        else
            flash[:danger] = "Try again!"
            redirect_to root
        end
    end

    private
    
        def post_params
            params.require(:post).permit(:title, :link, :content)
        end
    
end

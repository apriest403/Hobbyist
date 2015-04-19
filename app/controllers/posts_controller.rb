class PostsController < ApplicationController
before_action :authenticate_user!

    def new
        @hobbies = current_user.hobbies.all.map{|hobby| [hobby.name, hobby.id]}
        @post = current_user.posts.build
    end

    def create
        @hobbies = current_user.hobbies.all
        @post = current_user.posts.new(post_params)
        if @post.save 
            flash[:success] = "Post successful!"
            redirect_to hobbies_path
        else
            flash[:danger] = "Try again!"
            redirect_to hobbies_path
        end
    end

    def show
        @post = Post.find(params[:id])
    end

    private

        def post_params
            params.require(:post).permit(:title, :link, :content, :hobby_id)
        end

end
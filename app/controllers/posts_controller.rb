class PostsController < ApplicationController
    def index
        posts=Post.all
        render json:posts
    end

    def create
        post=Post.new(post_params)

        if post.save
            render json: post
        else
            render json:{error:'not valid'}
        end
    end

    def destroy
        post=Post.find(params[:id])
        post.destroy
        render json: {id:post.id}
    end

    private
    def post_params
        params.require(:post).permit(:title, :body)
    end

end

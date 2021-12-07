class HomeController < ApplicationController
    def index
        @posts = Post.order(:name)
    end
    def post
        @post = Post.find(params[:id])
        @comments = Comment.order(:created_at)
        @comment = Comment.new
        @comments_current_post = Comment.where(:post_id = @post.id)
    end
end

class HomeController < ApplicationController
    def index
        @posts = Post.order(:name)
    end
    def post
        @post = Post.find(params[:id])
        @comments = Comment.order(:created_at)
        @comment = Comment.new
    end
end

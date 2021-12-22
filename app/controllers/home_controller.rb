class HomeController < ApplicationController
    def index
        @posts = Post.order(:created_at)
    end
    def post
        @post = Post.find(params[:id])
        @ratings = Rating.where(post_id: @post.id)
        @rating = Rating.new
        @comment = Comment.new
        @comments = Comment.where(post_id: @post.id).where(comment_id: nil).order(:created_at)
        @comment_son = Comment.new
        @average = Rating.where(post_id: @post.id).average('value')
    end
end
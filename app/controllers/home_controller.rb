class HomeController < ApplicationController
    def index
        @posts = Post.order(:name)
    end
    def post
        @ratings = Rating.order(params[:id])
        @rating = Rating.new
        @post = Post.find(params[:id])
        @comment = Comment.new
        @comments = Comment.where(post_id: @post.id).where(comment_id: nil).order(:created_at)
        @comment_son = Comment.new
        @average = Rating.where(post_id: @post.id).average('value')
    end
end
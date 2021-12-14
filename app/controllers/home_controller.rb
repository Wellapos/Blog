class HomeController < ApplicationController
    def index
        @posts = Post.select("posts.id, posts.name, posts.summary, posts.created_at, AVG(ratings.value) as media").joins(:ratings).group("posts.id").order(created_at: :desc)
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
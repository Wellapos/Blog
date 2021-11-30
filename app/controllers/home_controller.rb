class HomeController < ApplicationController
    def index
        @posts = Post.order(:name)
    end
    def post
        @post = Post.find(params[:id])
    end
end

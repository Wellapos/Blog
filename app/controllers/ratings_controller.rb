class RatingsController < ApplicationController
    layout 'admin'
    
    def index
        @rating = Rating.order(params[:post_id])
    end

    def new
        @post = Post.find(params[:id])
        @rating = Rating.new
        get_variable
    end

    def create
        @rating = Rating.new(rating_params)
        get_variable
        @rating.user_id = current_user.id

        if @rating.save
        end
    end

    def edit
        @rating = Rating.find(params[:id])
    end

    private
    def get_variable
        @users = User.order(:email)
    end
    def rating_params
        params.require(:rating).permit(:value, :post_id, :rating_id)
    end
end
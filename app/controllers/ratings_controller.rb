class RatingsController < ApplicationController
    layout 'admin'
    
    def index
        @rating = Rating.order(params[:post_id])
        @ratings = Rating.order(params[:id])
    end

    def new
        @post = Post.find(params[:id])
        @rating = Rating.new
        get_variable
    end

    def create
        @ratings = Rating.order(params[:id])
        @rating = Rating.where(user_id: current_user.id, post_id: params[:rating][:post_id]).first
        if @rating.present?
            @rating.update(rating_params)
        else 
            @rating = Rating.new(rating_params)
            @rating.user_id = current_user.id
            @rating.save
            respond_to do |format|
                format.js
            end
        end
        @average = Rating.where(post_id: @rating.post_id).average('value')
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
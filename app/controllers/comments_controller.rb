class CommentsController < ApplicationController

    def index
        @comments = Comment.order(:created_at)
        @users = User.order(:email)
    end

    def new
        @comment = Comment.new
        get_variable
    end

    def create
        @comment = Comment.new(comment_params)
        get_variable
        @comment.user_id = current_user.id
        @comments = Comment.order(:created_at)

        if @comment.save
            respond_to do |format|
                format.js
            end
        else
            render :new, status: :unprocessable_entity
        end
    end

    def destroy
        @comment = Comment.find(params[:id])
        
        if @comment.present?
            @comment.destroy 
        end
        redirect_to comments_path
    end

    private
    def get_variable
        @users = User.order(:email)
    end
    def comment_params
        params.require(:comment).permit(:content, :post_id)
    end
end
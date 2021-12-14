class CommentsController < ApplicationController
    before_action :authenticate_user!
    load_and_authorize_resource
    layout 'admin'

    def index
        @comments = Comment.order(:created_at)
        @users = User.order(:email)
    end

    def new
        @post = Post.find(params[:id])
        @comment = Comment.new
        get_variable
    end

    def create
        @comment = Comment.new(comment_params)
        get_variable
        @comment_son = Comment.new
        @comment.user_id = current_user.id
        @comments = Comment.where(post_id: @comment.post_id).where(comment_id: nil).order(:created_at)


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
        @comments = Comment.where(post_id: @comment.post_id).where(comment_id: nil).order(:created_at)
        if @comment.present?
            @comment.destroy
            respond_to do |format|
                format.js
            end
        else
            redirect_to comments_path
        end
    end

    private
    def get_variable
        @users = User.order(:email)
    end
    def comment_params
        params.require(:comment).permit(:content, :post_id, :comment_id)
    end
end
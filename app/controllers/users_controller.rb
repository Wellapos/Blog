class UsersController < ApplicationController
    before_action :authenticate_user!
    load_and_authorize_resource
    layout 'admin'

    def index
        @users = User.order(:email)
    end

    def new
        @user = User.new
    end

    def edit
        @user = User.find(params[:id])
    end

    def create
        @user = User.new(user_params)
    
        if @user.save
            redirect_to users_path
        else
            render :new, status: :unprocessable_entity
        end
    end

    def update
        @user = User.find(params[:id])
    
        if @user.update(user_params)
            redirect_to users_path
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @user = User.find(params[:id])
        
        if @user.present?
            @user.destroy 
        end
        redirect_to users_path
    end

    private
    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation, :role_id)
    end
end

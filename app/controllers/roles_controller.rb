class RolesController < ApplicationController
    before_action :authenticate_user!
    load_and_authorize_resource
    layout 'admin'

    def index
        @roles = Role.order(:username)
    end

    def new
        @role = Role.new
    end

    def create
        @role = Role.new(role_params)
    
        if @role.save
            redirect_to roles_path
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        @role = Role.find(params[:id])
    end

    def update
        @role = Role.find(params[:id])
    
        if @role.update(role_params)
            redirect_to roles_path
        else
            render :edit, status: :unprocessable_entity
        end
    end
    
    private
    def role_params
        params.require(:role).permit(:username)
    end
end
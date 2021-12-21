class CategoriesController < ApplicationController
    before_action :authenticate_user!
    load_and_authorize_resource
    layout 'admin'

    def index
        @categories = Category.order(:name)
    end

    def new
        @category = Category.new
    end

    def create
        @category = Category.new(category_params)
    
        if @category.save
            redirect_to categories_path
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        @category = Category.find(params[:id])
    end

    def update
        @category = Category.find(params[:id])
    
        if @category.update(category_params)
            redirect_to categories_path
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @category = Category.find(params[:id])
        
        if @category.destroy
            message = "Excluido com sucesso!"
        else
            message = @category.errors.full_messages
        end

        respond_to do |format|
            format.html { redirect_to categories_path, notice: message }
        end
    end
    
    private
    def category_params
        params.require(:category).permit(:name, :description)
    end
end
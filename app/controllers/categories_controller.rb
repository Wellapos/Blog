class CategoriesController < ApplicationController
    def index
        @categories = Category.order(:name)
    end

    def new
        @categories = Category.new
    end

    def create

    end

    def edit
        @categories = Category.find(params[:id])
    end

    def update
        @categories = Category.find(params[:id])
    end

    def destroy
        @categories = Category.find(params[:id])

        if @Category.present?
            @Category.destroy
        end
        redirect_to categories_patch
    end
private
    def category_params
        params.require(:category).permit(:name, :description)
    end
end

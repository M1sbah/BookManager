class CategoriesController < ApplicationController

	before_action :set_category ,only: [:show, :update, :destroy] 

	def index

		setPageTitle "categories"

		@categories = Category.all

		authorize @categories

		# byebug
		if params[:id].present?
			@category = Category.find(params[:id])
		else
			@category = Category.new
		end
	end


	def show
		@category = Category.find(params[:id])

		setPageTitle @category.name
		@books=@category.books.page(params[:page])
	end

	def create
		@category = Category.new(category_params)
		if @category.save
			flash[:notice] = "Category added"
		else
			flash[:alert] = "Unable to add Category"	
		end
		redirect_to categories_path
	end

	def update
		if @category.update(category_params)
			flash[:notice] = "Category Updated"
		else
			flash[:alert] = "Unable to Update"		
		end
		redirect_to categories_path
	end

	def destroy

		@category.delete
		if @category.destroy
			flash[:notice] = "Category Removed"
		else
			flash[:alert] = "Unable to Removed"
		end
		redirect_to categories_path
	end


	private
	def category_params
		params.require(:category).permit(:name)
	end

	def set_category
		@category = Category.find(params[:id])
		authorize @category
	end
end

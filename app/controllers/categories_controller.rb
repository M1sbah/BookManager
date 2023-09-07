class CategoriesController < ApplicationController
	def index
		@categories = Category.all
		# byebug
		if params[:id].present?
			@category = Category.find(params[:id])
		else
			@category = Category.new
		end
	end

	def create
		@category = Category.new(category_params)
		if @category.save
			flash[:notice] = "Category added"
		else
			flash[:notice] = "Unable to add Category"
			
		end
		redirect_to categories_path
	end

	def update
		@category = Category.find(params[:id])
		if @category.update(category_params)
			flash[:notice] = "Category Updated"
		else
			flash[:notice] = "Unable to Update"
			
		end
		redirect_to categories_path
	end

	def destroy
		@category = Category.find(params[:id])
		if @category.destroy
			flash[:notice] = "Category Removed"
		else
			flash[:notice] = "Unable to Removed"
		end
		redirect_to categories_path
	end


	private
	def category_params
		params.require(:category).permit(:name)
	end
end
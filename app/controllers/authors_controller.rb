class AuthorsController < ApplicationController

	before_action :set_book , only: [:create, :edit, :update, :destroy]
	before_action :set_author , only: [:edit, :update, :destroy]


	def new
		setPageTitle "New author"
		@author = Author.new
		authorize @author
	end

	def create
		@author = Author.new(author_params)
		@author.book = @book
		if @author.save
			flash[:notice] = "#{@book.title} Author is created"
			redirect_to @book
		else
			flash[:alert] = "Unable to create Author"
			render :new, status: :unprocessable_entity
		end
	end

	def edit
		setPageTitle @author.name
	end

	def update
		if @author.update(author_params)
			flash[:notice] = "#{@book.title} Author is updated"
			redirect_to @book
		else
			flash[:alert] = "Unable to update Author"
			render :edit
		end
	end


	def destroy

		if @author.destroy
			flash[:notice] = "#{@book.title} Author is deleted"
		end
		redirect_to @book

	end

	private

	def author_params
		params.require(:author).permit(:name, :email)
	end

	def set_book
		@book = Book.friendly.find(params[:book_id])
	end

	def set_author
		@author = Author.find(params[:id])
		authorize @author
	end
end

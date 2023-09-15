class PublishersController < ApplicationController

	before_action :set_publisher , only: [:edit, :update, :destroy]
	before_action :set_book , only: [:create, :edit, :update, :destroy]


	def new
		setPageTitle "New"
		@publisher = Publisher.new
	end


	def create
		@publisher = Publisher.new(publisher_params)
		@publisher.book= @book

		if @publisher.save
			flash[:notice] = "Publisher Created"
			redirect_to @book
		else
			flash[:alert] = "Publisher not created"
			render :new
		end

	end


	def edit
		setPageTitle @publisher.publish
	end

	def update
		if @publisher.update(publisher_params)
			flash[:notice] = "Publisher Updated"
			redirect_to @book
		else
			flash[:alert] = "Publisher not Updated"
			redirect_to edit_book_publisher_path(@book)
		end

	end

	def destroy
		if @publisher.destroy
			flash[:notice] = "Publisher Deleted"
			redirect_to @book
		else
			flash[:alert] = "Publisher not Deleted"
			redirect_to edit_book_publisher_path(@book)
		end
	end

	private
	def publisher_params
		params.require(:publisher).permit(:publish, :address)
	end

	def set_publisher
		@publisher = Publisher.find(params[:id])
		authorize @publisher
	end
	def set_book
		@book = Book.friendly.find(params[:book_id])
	end

end
class BooksController < ApplicationController
  before_action :set_book, only: %i[ show edit update destroy ]
  before_action :authenticate_user! , except: [:index,:show]

  # GET /books or /books.json
  def index
    setPageTitle "Books"
    @books = Book.all.page(params[:page])
  end

  # GET /books/1 or /books/1.json
  def show
    setPageTitle @book.title
  end

  # GET /books/new
  def new
    setPageTitle "New"
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
    setPageTitle "#{@book.title}"
  end

  # POST /books or /books.json
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to @book
    else
      flash[:alert] = "Unable to create book"
      render :new, status: :unprocessable_entity
    end
    # respond_to do |format|
    #   if @book.save
    #     format.html { redirect_to book_url(@book), notice: "Book was successfully created." }
    #     format.json { render :show, status: :created, location: @book }
    #   else
    #     format.html { render :new, status: :unprocessable_entity }
    #     format.json { render json: @book.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /books/1 or /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to book_url(@book), notice: "Book was successfully updated." }
        format.json { render :show, status: :ok, location: @book }
      else
        flash[:alert] = "Unable to update book"
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1 or /books/1.json
  def destroy
    @book.delete
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: "Book was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.friendly.find(params[:id])
      authorize @book
    end

    # Only allow a list of trusted parameters through.
    def book_params
      params.require(:book).permit(:cover,:book_pdf, :title, :desc, :price, :page, category_ids:[])
    end
end

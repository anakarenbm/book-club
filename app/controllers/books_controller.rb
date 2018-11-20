class BooksController < ApplicationController
  def index
    @books = Book.all
    @book = Book.new
  end

  # def new
  #   @book = Book.new
  # end

  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to @club, notice: 'Book was successfully created.' }
        format.json { render :show, status: :created, location: @club }
      else
        format.html { render :new }
        format.json { render json: @club.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :author, :genre_id, :pages, :picture)
  end
end

class BooksController < ApplicationController
  before_action :authenticate_user!

  def index
    @books = Book.all
    @book = Book.new
    @user_book_list = BookList.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def all_index
    @books = Book.all
  end

  def edit
    @edit_book = Book.find(params[:id])
  end

  def create
    @book = Book.new(book_params)
    respond_to do |format|
      if @book.save
        format.html { redirect_to books_path, notice: 'Book was successfully created.' }
        format.json { render :show, status: :created, location: @club }
      else
        format.html { redirect_to books_path, notice: 'Error creating book.' }
      end
    end
  end

  def update
    @edit_book = Book.find(params[:id])

    respond_to do |format|
      if @edit_book.update(book_params)
        format.html { redirect_to books_path, notice: 'Book was successfully updated.' }
      else
        format.html { redirect_to books_path, notice: 'Error updating book.' }
      end
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :author, :genre_id, :pages, :picture)
  end
end

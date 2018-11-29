module Books
class BookListsController < ApplicationController
  before_action :authenticate_user!

  def show
  end

  def create
    @book = Book.find(params[:book_id])
    @book_list = BookList.new(book_list_params.merge(default_params))

    respond_to do |format|
      if @book_list.save
        format.html { redirect_to books_path, notice: 'Book was added to list created.' }
        # format.json { render :show, status: :created, location: @book_list }
      else
        format.html { redirect_to books_path, notice: @book_list.errors.full_messages }
        # format.json { render json: @book_list.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_list_params
      params.require(:book_list).permit(:status)
    end

    def default_params
      {
        ownerable: current_user, #owner could be a club (tbd for implementation)
        book: @book,
        pages_read: 0
      }
    end
end
end

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
        else
          format.html { redirect_to books_path, notice: @book_list.errors.full_messages }
        end
      end
    end

    private

      def book_list_params
        params.require(:book_list).permit(:status)
      end

      def default_params
        {
          ownerable: current_user,
          book: @book,
          pages_read: 0
        }
      end
  end
end

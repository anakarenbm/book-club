class BookListsController < ApplicationController
  before_action :authenticate_user!

  def update
    @book_list = BookList.find(params[:id])
    respond_to do |format|
      updated_params = book_list_params
      if finished_book?
        updated_params = updated_params.merge(change_status_to_done)
      end
      if @book_list.update(updated_params)
        format.html { redirect_to user_path(current_user), notice: 'Book-List was successfully updated.' }
        format.json { render :show, status: :ok, location: @book_list }
      else
        format.html { redirect_to user_path(current_user), notice: 'ERROR updating Book-List.' }
        format.json { render json: @book_list.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @book_list = BookList.find(params[:id])
    @book_list.destroy

    respond_to do |format|
      format.html { redirect_to user_path(current_user), notice: 'Book was successfully removed from list.' }
      format.json { head :no_content }
    end
  end

  private

    def book_list_params
      params.require(:book_list).permit(:pages_read)
    end

    def finished_book?
      book_list_params[:pages_read].to_i >= @book_list.book.pages
    end

    def change_status_to_done
      {
        status: 3
      }
    end

end

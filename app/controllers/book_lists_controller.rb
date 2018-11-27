class BookListsController < ApplicationController
  def show
  end

  def update
    @book_list = BookList.find(params[:id])
    respond_to do |format|
      if @book_list.update(book_list_params)
        format.html { redirect_to user_path(current_user), notice: 'Book-List was successfully updated.' }
        format.json { render :show, status: :ok, location: @book_list }
      else
        format.html { redirect_to user_path(current_user), notice: 'ERROR updating Book-List.' }
        format.json { render json: @book_list.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_list_params
      params.require(:book_list).permit(:pages_read)
    end

    # def default_params
    #   {
    #     ownerable: current_user, #owner could be a club (tbd for implementation)
    #     book: @book
    #   }
    # end
end

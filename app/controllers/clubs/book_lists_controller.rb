module Clubs
  class BookListsController < ApplicationController
    before_action :authenticate_user!

    def create
      @club = Club.find(params[:club_id])
      @book_list = BookList.new(book_list_params.merge(default_params))

      respond_to do |format|
        if @book_list.save
          format.html { redirect_to @club, notice: 'Book was added to the club.' }
          # format.json { render :show, status: :created, location: @book_list }
        else
          format.html { redirect_to @club, notice: @book_list.errors.full_messages }
          # format.json { render json: @book_list.errors, status: :unprocessable_entity }
        end
      end
    end

    private

      def book_list_params
        params.require(:book_list).permit(:book_id)
      end

      def default_params
        {
          ownerable: @club
        }
      end

  end
end

module BookLists
class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def create
    @book_list = BookList.find(params[:book_list_id])
    @review = Review.new(review_params.merge(default_params))
    respond_to do |format|
      if @review.save
        format.html { redirect_to user_path(current_user), notice: 'Review was successfully created.' }
      else
        format.html { redirect_to user_path(current_user), notice: 'Error creating review.' }
      end
    end
  end

  def update
    @review = Review.find(params[:id])
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to user_path(current_user), notice: 'Review was successfully updated.' }
      else
        format.html { redirect_to user_path(current_user), notice: 'Error updating review.' }
      end
    end
  end

  private

    def review_params
      params.require(:review).permit(:stars)
    end

    def default_params
      {
        book: @book_list.book,
        user: current_user
      }
    end

end
end

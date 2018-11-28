class UsersController < ApplicationController
  def show
    @new_review = Review.new
  end
end

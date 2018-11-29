class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def show
    @new_review = Review.new
  end
end

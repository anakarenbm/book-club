class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @new_review = Review.new
  end

  def current_user_home
    redirect_to current_user
  end
end

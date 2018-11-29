module Clubs
  class UserClubsController < ApplicationController
    before_action :authenticate_user!

    def create
      @club = Club.find(params[:club_id])
      @user_club = UserClub.new(default_params)

      respond_to do |format|
        if @user_club.save
          format.html { redirect_to @club, notice: 'User sucessfully joined club.' }
        else
          format.html { redirect_to clubs_path, notice: @user_club.errors.full_messages }
        end
      end
    end

    private

      def default_params
        {
          club: @club,
          user: current_user
        }
      end
  end
end

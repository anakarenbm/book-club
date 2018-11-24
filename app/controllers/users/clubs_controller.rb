module Users
  class ClubsController < ApplicationController
    def index
      @clubs = Club.all
    end
  end
end

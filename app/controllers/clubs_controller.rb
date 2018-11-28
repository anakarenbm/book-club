class ClubsController < ApplicationController
  before_action :authenticate_user!, only: [:show, :edit, :update, :destroy]
  before_action :set_club, only: [:show, :edit, :update, :destroy]

  def index
    @clubs = Club.all
    @new_user_joins_club = UserClub.new
  end

  def show
    @all_posts = Post.all
    @new_post = Post.new
    @new_comment = Comment.new
    @new_current_book = BookList.new
  end

  def new
    @club = Club.new
  end

  def edit
  end

  def create
    @club = Club.new(club_params.merge(default_params))

    respond_to do |format|
      if @club.save
        format.html { redirect_to @club, notice: 'Club was successfully created.' }
        format.json { render :show, status: :created, location: @club }
      else
        format.html { render :new }
        format.json { render json: @club.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @club.update(club_params)
        format.html { redirect_to @club, notice: 'Club was successfully updated.' }
        format.json { render :show, status: :ok, location: @club }
      else
        format.html { render :edit }
        format.json { render json: @club.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @club.destroy
    respond_to do |format|
      format.html { redirect_to clubs_url, notice: 'Club was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_club
      @club = Club.find(params[:id])
    end

    def club_params
      params.require(:club).permit(:title, :description, :book_due_date)
    end

    def default_params
      {
        admin: current_user
      }
    end
end

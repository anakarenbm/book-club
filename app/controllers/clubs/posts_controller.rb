module Clubs
  class PostsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_post, only: [:show, :edit, :update, :destroy]

    def create
      @club = Club.find(params[:club_id])
      @post = Post.new(post_params.merge(default_params))

      respond_to do |format|
        if @post.save
          format.html { redirect_to @club, notice: 'Post was successfully created.' }
        else
          format.html { redirect_to @club, notice: 'Error while creating post.' }
        end
      end
    end

    def update
      @club = Club.find(params[:club_id])
      @post = Post.find(params[:id])

      respond_to do |format|
        if @post.update(post_params)
          format.html { redirect_to @club, notice: 'Post was successfully updated.' }
        else
          format.html { redirect_to @club, notice: 'Error while updating post.' }
        end
      end
    end

    def destroy
      @club = Club.find(params[:club_id])
      @post.destroy
      respond_to do |format|
        format.html { redirect_to @club, notice: 'Post was successfully destroyed.' }
      end
    end

    private
      def set_post
        @post = Post.find(params[:id])
      end

      def post_params
        params.require(:post).permit(:content, :club_id)
      end

      def default_params
        {
          club: @club,
          user: current_user
        }
      end
  end
end

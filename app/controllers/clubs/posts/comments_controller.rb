module Clubs
  module Posts
    class CommentsController < ApplicationController
      before_action :authenticate_user!
      before_action :set_comment, only: [:show, :edit, :update, :destroy]

      def create
        @club = Club.find(params[:club_id])
        @post = Post.find(params[:post_id])
        @comment = Comment.new(comment_params.merge(default_params))

        respond_to do |format|
          if @comment.save
            format.html { redirect_to @club, notice: 'Comment was successfully created.' }
          else
            format.html { redirect_to @club, notice: @comment.errors.full_messages }
          end
        end
      end

      def update
        @club = Club.find(params[:club_id])
        @post = Post.find(params[:post_id])
        @comment = Comment.find(params[:id])

        respond_to do |format|
          if @comment.update(comment_params)
            format.html { redirect_to @club, notice: 'Comment was successfully updated.' }
          else
            format.html { redirect_to @club, notice: 'Error while updating comment.' }
          end
        end
      end

      private
        def set_comment
          @comment = Comment.find(params[:id])
        end

        def comment_params
          params.require(:comment).permit(:content)
        end

        def default_params
          {
            post: @post,
            user: current_user
          }
        end
    end
  end
end

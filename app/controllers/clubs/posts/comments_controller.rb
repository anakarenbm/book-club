module Clubs
  module Posts
class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @comments = Comment.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @comment = Comment.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @club = Club.find(params[:club_id])
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params.merge(default_params))

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @club, notice: 'Comment was successfully created.' }
        # format.json { render :show, status: :created, location: @post }
      else
        format.html { redirect_to @club, notice: @comment.errors.full_messages }
        # format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
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

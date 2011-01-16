class CommentsController < ApplicationController
  before_filter :authenticate_user!

  def create
    @comment = Comment.new(params[:comment])
    @comment.user = current_user
    @comment.save
    redirect_to place_path(@comment.commentable_id)
  end

  def destroy
    @comment = Comment.find(params[:comment])
    @comment.destroy
    redirect_to place_path(@place)
  end
end

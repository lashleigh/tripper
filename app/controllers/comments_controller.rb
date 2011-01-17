class CommentsController < ApplicationController
  before_filter :authenticate_user!

  def create
    @comment = Comment.new(params[:comment])
    @comment.user = current_user
    @comment.save
    respond_to do |format|
      format.html { redirect_to place_path(@comment.commentable_id) }
      format.js
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @place = @comment.commentable
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to place_path(@place) }
      format.js
    end
  end
end

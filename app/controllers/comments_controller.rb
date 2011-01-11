class CommentsController < ApplicationController
  before_filter :authenticate_user!

  def create
    @place = Place.find(params[:place_id])
    @comment = @place.comments.create(params[:comment])
    @comment.user = current_user
    @comment.save
    redirect_to place_path(@place)
  end

  def destroy
    @place = Place.find(params[:place_id])
    @comment = @place.comments.find(params[:id])
    @comment.destroy
    redirect_to place_path(@place)
  end
end

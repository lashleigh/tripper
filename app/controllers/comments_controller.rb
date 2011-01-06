class CommentsController < ApplicationController
  before_filter :authenticate, :only => :destroy

  def create
    @place = Place.find(params[:place_id])
    @comment = @place.comments.create(params[:comment])
    redirect_to place_path(@place)
  end

  def destroy
    @place = Place.find(params[:place_id])
    @comment = @place.comments.find(params[:id])
    @comment.destroy
    redirect_to place_path(@place)
  end
end

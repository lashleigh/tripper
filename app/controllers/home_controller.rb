class HomeController < ApplicationController
  def index
    @places = Place.all.reverse
    @comments = Comment.all.reverse
    @activity = (@places + @comments).sort { |a, b| b.created_at <=> a.created_at }

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @places }
    end
  end

end

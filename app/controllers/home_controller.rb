class HomeController < ApplicationController
  def index
    @places = Place.all.reverse

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @places }
    end
  end

end

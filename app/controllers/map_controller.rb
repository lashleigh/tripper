class MapController < ApplicationController
  def index
    @places = Place.all.reverse

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @places }
    end
  end

 def new_place
    @tags = tag_string
    @place = Place.new
    @place.latitude = params[:lat]
    @place.longitude = params[:lng]
    @place.name = params[:name]
    @place.address = params[:address]
    @place.designation_list = params[:designation]
    @place.facility_list = params[:facilities]

    if not @place.latitude and @place.longitude
      render :text => "<h3>Please provide the coordinates of your place.</h3>"
    else
      render :layout => false
    end
  end

end

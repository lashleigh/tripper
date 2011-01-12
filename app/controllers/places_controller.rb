class PlacesController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index]
  layout "application"

  # Update Place location
  def update_location
    place = Place.find(params[:id])
    place.latitude = params[:lat]
    place.longitude = params[:lon]
    place.save
    render :text => place.to_json
  end

  # GET /places
  # GET /places.xml
  def index
    @places = Place.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @places }
    end
  end

  # GET /places/1
  # GET /places/1.xml
  def show
    @place = Place.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @place }
    end
  end

  # GET /places/new
  # GET /places/new.xml
  def new
    @place = Place.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @place }
    end
  end

  # GET /places/1/edit
  def edit
    @place = Place.find(params[:id])
    unless @place.user == current_user or current_user.admin?
      flash[:error] = "You are not authorized to edit that suggestion."
      redirect_to :action => :home
      return
    end
  end

  # POST /places
  # POST /places.xml
  def create
    unless user_signed_in?
      flash[:error] = "You must be logged in to create a suggestion"
      redirect_to(places_url)
      return
    end

    @place = Place.new(params[:place])
    @place.designation_list = params[:designation]
    @place.facility_list = params[:facilities]
    @place.user = current_user
    
    respond_to do |format|
      if @place.save
        format.html { redirect_to(@place, :notice => 'Place was successfully created.') }
        format.xml  { render :xml => @place, :status => :created, :location => @place }
        format.js { render :json => @place, :status => :created, :location => @place  }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @place.errors, :status => :unprocessable_entity }
        format.js { render :json => @place.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /places/1
  # PUT /places/1.xml
  def update
    @place = Place.find(params[:id])
    @place.designation_list = params[:designation]
    @place.facility_list = params[:facilities]

    respond_to do |format|
      if @place.update_attributes(params[:place])
        format.html { redirect_to(@place, :notice => 'Place was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @place.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /places/1
  # DELETE /places/1.xml
  def destroy
    @place = Place.find(params[:id])
    if current_user and (current_user.admin? or @place.user == current_user)
      @place.destroy
    else
      flash[:error] = "It appears you attempted to delete a suggestion that you did not create. Perhaps you need to log in?"
    end

    respond_to do |format|
      format.html { redirect_to("/home/index") }
      format.xml  { head :ok }
    end
  end
end

class ApplicationController < ActionController::Base
  protect_from_forgery

  private
 
  def authenticate
    authenticate_or_request_with_http_basic do |user_name, password|
      user_name == 'admin' && password == 'password'
    end
  end

  def tag_string
    ["campsite", "restroom", "shower", "bear_box", "hike_bike_camp", "beach_wheelchair", "biketrails", "boat_mooring", "boat_ramps"]
  end

end

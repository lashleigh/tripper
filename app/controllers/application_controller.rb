class ApplicationController < ActionController::Base
  protect_from_forgery

  private
 
  def authenticate
    authenticate_or_request_with_http_basic do |user_name, password|
      user_name == 'admin' && password == 'password'
    end
  end

  def tag_string
    ["Campsite", "Restroom", "Shower", "Bear box", "Hike and bike", "Beach wheelchair access", "Bicycle trails", "Boat mooring", "Boat ramps"]
  end

end

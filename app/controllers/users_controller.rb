class UsersController < ApplicationController
  def show
    @user = User.find_by_username(params[:id])
    @places = @user.places 
  end
end

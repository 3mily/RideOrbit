require 'pry'

class PlacesController < ApplicationController
  protect_from_forgery

  def index
    @place = Place.new
    @places = Place.where(user_id: current_user.id)
  end

  def create
    lat = params["results"]["2"]["geometry"]["location"]["lat"].to_f
    lng = params["results"]["2"]["geometry"]["location"]["lng"].to_f
    cross_street = params["results"]["0"]["address_components"]["0"]["short_name"] +
      " and " + params["results"]["1"]["address_components"]["0"]["short_name"]
    
    @place = Place.new
    @place.user_id = current_user.id
    @place.name = params["name"]
    @place.cross_street = params["cross_street"]
    @places.cross_street_point = "#{lat},#{lng}"

    if @place.save
      flash[:notice] = "New place added!"
      # binding.pry
      redirect_to places_path
    else
      render :index
    end
    
  end



  # helper method
  # def place_params
  #   params.require(:place).permit(:name)
  # end

end

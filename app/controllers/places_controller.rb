require 'pry'

class PlacesController < ApplicationController
  protect_from_forgery
  respond_to :json

  def index
    @place = Place.new
    @places = Place.where(user_id: current_user.id)
  end

  def create
    lat = params["results"]["0"]["geometry"]["location"]["lat"].to_f
    lng = params["results"]["0"]["geometry"]["location"]["lng"].to_f
    cross_street = params["results"]["0"]["formatted_address"]
    
    @place = Place.new
    @place.user_id = current_user.id
    @place.name = params["name"]
    @place.cross_street = cross_street
    @place.cross_street_point = "#{lat},#{lng}"
    @place.save
    
    respond_with @place
  end
end

require 'pry'

class PlacesController < ApplicationController
  def index
    @place = Place.new
    @places = Place.where(user_id: current_user.id)
  end

  def create
    @place = Place.new(place_params)
    @place.user_id = current_user.id
    if @place.save
      flash[:notice] = "New place added!"
      # binding.pry
      redirect_to places_path
    else
      render :index
    end
  end

  def places_select_tag(places, options = {})
    select_options = places.map do |place|
      [place.name, place.cross_street]
    end
    select_tag options_for_select(select_options), options
  end



  # helper method
  def place_params
    params.require(:place).permit(:cross_street, :name)
  end

end

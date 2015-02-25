require 'pry'

class PlacesController < ApplicationController
  def index
    @place = Place.new
    @places = Place.where(user_id: current_user.id)
  end

  def create
    @place = Place.new(place_params)
    # binding.pry
    @place.user_id = current_user.id
    if @place.save
      flash[:notice] = "New place added!"
      # binding.pry
      redirect_to places_path
    else
      render :index
    end
  end



  # helper method
  def place_params
    params.require(:place).permit(:name)
  end

end

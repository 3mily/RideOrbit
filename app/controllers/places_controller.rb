class PlacesController < ApplicationController
  def index
    @place = Place.new
  end
end

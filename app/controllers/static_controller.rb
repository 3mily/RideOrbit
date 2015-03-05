require 'pry'

class StaticController < ApplicationController
  def index
    render :index
  end

  def newcommute
    @passenger_commute = Passengercommute.new
    @passenger_commute.user_id = current_user.id

    @driver_commute = Drivercommute.new
    @driver_commute.user_id = current_user.id
  end


  def commuteslist
    @places = Place.where(user_id: current_user.id)
    @driver_commutes = Drivercommute.where(user_id: current_user.id)
    @passenger_commutes = Passengercommute.where(user_id: current_user.id)
  end

  def exit
    
  end

end

class CommutesController < ApplicationController
  def index
  end

  def new
    @driver_commute = Drivercommute.new
    @driver_commute.user_id = current_user.id
    
    @passenger_commute = Passengercommute.new
    @passenger_commute.user_id = current_user.id
  end

  def create
    @driver_commute = Drivercommute.new
    @driver_commute.user_id = current_user.id
    
    @passenger_commute = Passengercommute.new
    @passenger_commute.user_id = current_user.id
  end






  #helper methods
  def driver_commute_params
    params.require(:driver_commute).permit(
      :car_type, 
      :seats_available, 
      :driver_origin, 
      :driver_destination, 
      :driver_arrival_time
    )
  end

  def passenger_commute_params
    params.require(:passenger_commute).permit(
      :passenger_origin, 
      :passenger_destination, 
      :passenger_arrival_time
    )
  end

end

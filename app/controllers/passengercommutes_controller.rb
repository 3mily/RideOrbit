require 'pry'

class PassengercommutesController < ApplicationController

  def create    
    @passenger_commute = Passengercommute.new(passenger_commute_params)
    @passenger_commute.user_id = current_user.id
    @passenger_commute.origin = nil
    @passenger_commute.destination = nil
    @passenger_commute.save

    redirect_to commuteslist_path
  end

  def destroy
  end






  #helper methods
  def passenger_commute_params
    params.require(:passengercommute).permit(
      :origin, 
      :destination, 
      :arrival_time
    )
  end

end

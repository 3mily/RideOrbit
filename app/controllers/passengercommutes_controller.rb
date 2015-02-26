require 'pry'

class PassengercommutesController < ApplicationController

  def create    
    @passenger_commute = Passengercommute.new(passenger_commute_params)
    @passenger_commute.user_id = current_user.id
    @passenger_commute.user_info = current_user
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

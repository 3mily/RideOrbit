require 'pry'

class PassengercommutesController < ApplicationController

  def create    
    @passenger_commute = Passengercommute.new(passenger_commute_params)
    @passenger_commute.user_id = current_user.id
    @passenger_commute.user_info = current_user
    passenger_origin_params
    passenger_destination_params
    @passenger_commute.save

    redirect_to commuteslist_path
  end

  def destroy
  end






  #helper methods
  def passenger_commute_params
    params.require(:passengercommute).permit(
      :arrival_time
    )
  end

  def passenger_origin_params
    passenger_origin_data = params["passenger_origin"].split(",")
    passenger_origin_point = passenger_origin_data[-2] + ", " + passenger_origin_data[-1]
    @passenger_commute.origin_name = passenger_origin_data[0]
    @passenger_commute.origin = passenger_origin_point
  end

  def passenger_destination_params
    passenger_destination_data = params["passenger_destination"].split(",")
    passenger_destination_point = passenger_destination_data[-2] + ", " + passenger_destination_data[-1]
    @passenger_commute.destination_name = passenger_destination_data[0]
    @passenger_commute.destination = passenger_destination_point
  end

end

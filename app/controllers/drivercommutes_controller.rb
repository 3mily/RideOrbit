require 'pry'

class DrivercommutesController < ApplicationController


  def create
    @driver_commute = Drivercommute.new(driver_commute_params)
    @driver_commute.user_id = current_user.id
    @driver_commute.user_info = current_user
    driver_origin_params
    driver_destination_params

    @driver_commute.save
    redirect_to commuteslist_path
  end

  def destroy
  end

  #helper methods
  def driver_commute_params
    params.require(:drivercommute).permit(
      :car_type, 
      :seats_available, 
      :arrival_time
    )
  end

  def driver_origin_params
    driver_origin_data = params["driver_origin"].split(",")
    driver_origin_point = driver_origin_data[-2]+", "+driver_origin_data[-1]
    driver_origin_name = driver_origin_data[0]
    @driver_commute.origin_name = driver_origin_name
    @driver_commute.origin = driver_origin_point
  end

  def driver_destination_params
    driver_destination_data = params["driver_destination"].split(",")
    driver_destination_point = driver_destination_data[-2]+", "+driver_destination_data[-1]
    driver_destination_name = driver_destination_data[0]
    @driver_commute.destination_name = driver_destination_name
    @driver_commute.destination = driver_destination_point
  end

end

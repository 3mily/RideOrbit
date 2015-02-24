require 'pry'

class DrivercommutesController < ApplicationController


  def create
    @driver_commute = Drivercommute.new(driver_commute_params)
    @driver_commute.user_id = current_user.id
    binding.pry
    # @driver_commute.origin = nil
    # @driver_commute.destination = nil
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
      :origin, 
      :destination, 
      :arrival_time
    )
  end

end

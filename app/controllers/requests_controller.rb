require 'pry'
class RequestsController < ApplicationController
  def create
    binding.pry
    @request = Request.new
    if params["user"]=="driver"
      @request.drivercommute_id = params["user_commute_id"]
      @request.passengercommute_id = params["requested_commute_id"]
      @request.initiated_by_driver = true
    else
      @request.drivercommute_id = params["requested_commute_id"]
      @request.passengercommute_id = params["user_commute_id"]
      @request.initiated_by_driver = false
    end
    @request.initiated_by_id = params["initiator"]
    @request.request_receiver_name = params["request_receiver_name"]
    @request.request_receiver_phone = params["request_receiver_phone"]
    @request.save
    render json: @request
  end

  def destroy
  end

  def update
    @update_request = Request.find(params["id"])
    if params["status"]=="accept"
      @update_request.approved_at = Time.now
      @update_request.approved_by_id = current_user.id
    else
      @update_request.rejected_at = Time.now
    end
    @update_request.save
    render json: @update_request
  end

  def index
    @user = current_user
    @total_driver_requests = 0
    @total_passenger_requests = 0
    @rejected_driver_requests = 0
    @rejected_passenger_requests = 0
    @total_outgoing_driver_pending = 0
    @total_outgoing_passenger_pending = 0
  end

end

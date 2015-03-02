class RequestsController < ApplicationController
  def create
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
    @request.save
    render json: @request
  end

  def destroy
  end

  def update
    render json: params
  end

  def index
    @user = current_user
  end

end

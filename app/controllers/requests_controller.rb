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
    @update_request = Request.find(params["request_id"])
    if params["status"]=="accept"
      @update_request.approved_at = Time.now
      @update_request.approved_by_id = current_user.id
    else
      @update_request.rejected_at = Time.now
    end
    # @update_request.save
    render json: @update_request
  end

  def index
    @user = current_user
  end

end

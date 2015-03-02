class Request < ActiveRecord::Base
  belongs_to :drivercommute
  belongs_to :passengercommute




# user.requests.each do request
#   if request.approved_by_id.nil?
#   end


end

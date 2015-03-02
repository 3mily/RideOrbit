class Review < ActiveRecord::Base
  belongs_to :drivercommute
  belongs_to :passengercommute
end

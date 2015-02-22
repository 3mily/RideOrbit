class Drivercommute < ActiveRecord::Base
  belongs_to :user
  has_many :passengercommutes
  has_many :requests
  has_many :reviews
end

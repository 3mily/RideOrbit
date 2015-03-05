class Drivercommute < ActiveRecord::Base
  belongs_to :user
  has_one :passengercommute
  has_many :requests
  has_many :reviews
  scope :within_origin, ->(current_passengercommutes_id,earth_degree) {where("origin <@ CIRCLE((SELECT origin FROM passengercommutes WHERE passengercommutes.id = ?), ?)", current_passengercommutes_id, earth_degree)}
  scope :within_destination, ->(current_passengercommutes_id,earth_degree) {where("destination <@ CIRCLE((SELECT destination FROM passengercommutes WHERE passengercommutes.id = ?), ?)", current_passengercommutes_id, earth_degree)}
  
end

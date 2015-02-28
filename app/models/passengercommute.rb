class Passengercommute < ActiveRecord::Base
  belongs_to :drivercommute
  belongs_to :user
  #Idk if interpolating something into the scope works that way btw, need to test later -gab
  scope :within_origin, ->(current_drivercommutes_id,earth_degree) {where("origin <@ CIRCLE((SELECT origin FROM drivercommutes WHERE drivercommutes.id = ?), ?)", current_drivercommutes_id, earth_degree)}
  scope :within_destination, ->(current_drivercommutes_id,earth_degree) {where("destination <@ CIRCLE((SELECT destination FROM drivercommutes WHERE drivercommutes.id = ?), ?)", current_drivercommutes_id, earth_degree)}
end

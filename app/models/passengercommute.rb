class Passengercommute < ActiveRecord::Base
  belongs_to :drivercommute
  #Idk if interpolating something into the scope works that way btw, need to test later -gab
  scope :within_origin, ->(current_drivercommutes_id) {where("origin <@ CIRCLE((SELECT origin FROM drivercommutes WHERE drivercommutes.id = ?), ?)", current_drivercommutes_id, 0.015)}
  scope :within_destination, ->(current_drivercommutes_id) {where("destination <@ CIRCLE((SELECT destination FROM drivercommutes WHERE drivercommutes.id = ?), ?)", current_drivercommutes_id, 0.015)}
end

class Passengercommute < ActiveRecord::Base
  belongs_to :drivercommute
  #Idk if interpolating something into the scope works that way btw, need to test later -gab
  scope :within_origin, ->(current_user_id) {where("origin <@ CIRCLE((SELECT origin FROM drivercommutes WHERE drivercommutes.id = ?), ?)", current_user_id, 0.015)}
  scope :within_destination, ->(current_user_id) {where("destination <@ CIRCLE((SELECT destination FROM drivercommutes WHERE user_id = ?), ?)", current_user_id, 0.015)}
end

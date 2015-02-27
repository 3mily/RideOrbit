class Drivercommute < ActiveRecord::Base
  belongs_to :user
  has_many :passengercommutes
  has_many :requests
  has_many :reviews
  scope :within_origin, ->(current_user_id) {where("origin <@ CIRCLE((SELECT origin FROM passengercommutes WHERE user_id = ?), 0.015)", current_user_id)}
  scope :within_destination, ->(current_user_id) {where("destination <@ CIRCLE((SELECT destination FROM passengercommutes WHERE user_id = ?), 0.015)", current_user_id)}
end

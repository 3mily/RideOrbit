class Commute < ActiveRecord::Base
  belongs_to :user
  has_many :passengers
  has_many :requests
  has_many :reviews
end

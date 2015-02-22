class User < ActiveRecord::Base
  has_many :drivercommutes
  has_many :places
  has_secure_password
end

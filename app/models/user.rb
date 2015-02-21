class User < ActiveRecord::Base
  has_many :commutes
  has_many :places
  has_secure_password
end

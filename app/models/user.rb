class User < ActiveRecord::Base
  mount_uploader :picture, AvatarUploader
  has_many :drivercommutes
  has_many :passengercommutes
  has_many :places
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :phone, presence: true, uniqueness: true
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :password, length: { in: 1..20}, on: :create
end

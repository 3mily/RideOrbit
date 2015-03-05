class AddDriverPassengerColumns < ActiveRecord::Migration
  def change
    add_column :drivercommutes, :passenger, :integer
    add_column :passengercommutes, :driver, :integer
  end
end
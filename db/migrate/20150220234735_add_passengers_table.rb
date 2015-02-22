class AddPassengersTable < ActiveRecord::Migration
  def change
    create_table :passengercommutes do |t|
      t.references :users, index: true #passenger
      t.references :commutes, index: true
      t.point :pickup
      t.point :dropoff
      t.time :passenger_arrival_time
      t.json :days

      t.timestamps
    end
  end
end

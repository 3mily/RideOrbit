class AddPassengersTable < ActiveRecord::Migration
  def change
    create_table :passengers do |t|
      t.references :users, index: true #passenger
      t.references :commutes, index: true
      t.point :pickup
      t.point :dropoff
      t.time :passenger_arrival_time

      t.timestamps
    end
  end
end

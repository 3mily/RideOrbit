class AddPassengersTable < ActiveRecord::Migration
  def change
    create_table :passengercommutes do |t|
      t.references :user, index: true #passenger
      t.references :commute, index: true
      t.point :passenger_origin
      t.point :passenger_destination
      t.time :passenger_arrival_time
      t.json :days

      t.timestamps
    end
  end
end

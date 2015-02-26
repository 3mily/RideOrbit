class AddPassengersTable < ActiveRecord::Migration
  def change
    create_table :passengercommutes do |t|
      t.references :user, index: true #passenger
      t.references :drivercommute, index: true
      t.point :origin
      t.string :origin_name
      t.point :destination
      t.string :destination_name
      t.time :arrival_time
      t.json :days
      t.json :user_info

      t.timestamps
    end
  end
end

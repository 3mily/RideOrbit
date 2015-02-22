class AddCommutesTable < ActiveRecord::Migration
  def change
    create_table :drivercommutes do |t|
      t.references :users, index: true
      t.string :car_type
      t.point :driver_origin
      t.point :driver_destination
      t.time :driver_arrival_time
      t.json :days
      t.integer :seats_available

      t.timestamps
    end
  end
end

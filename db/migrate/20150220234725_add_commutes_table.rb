class AddCommutesTable < ActiveRecord::Migration
  def change
    create_table :drivercommutes do |t|
      t.references :users, index: true
      t.string :car_type
      t.string :driver_origin
      t.string :driver_destination
      t.time :driver_arrival_time
      t.json :days

      t.timestamps
    end
  end
end

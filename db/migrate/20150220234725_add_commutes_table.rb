class AddCommutesTable < ActiveRecord::Migration
  def change
    create_table :drivercommutes do |t|
      t.references :user, index: true
      t.string :car_type
      t.point :origin
      t.string :origin_name
      t.point :destination
      t.string :destination_name
      t.time :arrival_time
      t.json :days
      t.integer :seats_available

      t.timestamps
    end
  end
end

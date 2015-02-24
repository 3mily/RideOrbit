class AddPlacesTable < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.references :user, index: true
      t.string :cross_street
      t.json :cross_street_point
      t.string :name #ex: home or work

      t.timestamps
    end
  end
end

class AddRequestsTable < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.references :commutes, index: true
      t.datetime :approved_at
      t.datetime :rejected_at
      t.integer :initiated_by_id # from current user
      t.integer :approved_by_id # from current user
      t.boolean :initiated_by_driver

      t.timestamps
    end
  end
end

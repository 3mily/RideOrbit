class RemoveDriverColumn < ActiveRecord::Migration
  def change
    remove_column :users, :is_driver
  end
end

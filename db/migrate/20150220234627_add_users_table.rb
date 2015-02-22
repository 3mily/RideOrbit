class AddUsersTable < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :phone
      t.string :password_digest
      t.boolean :is_driver
      t.string :linkedin
      t.float :rating
      t.string :picture

      t.timestamps
    end
  end
end

class AddReviewsTable < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :drivercommute, index: true
      t.integer :reviewee_id #
      t.integer :reviewer_id #
      t.integer :rating
      t.string :body

      t.timestamps
    end
  end
end

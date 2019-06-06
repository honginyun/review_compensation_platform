class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.integer :compensation_id
      t.string :review_content
      t.integer :product_id
      t.integer :ratings
      t.integer :reviewer_id

      t.timestamps
    end
  end
end

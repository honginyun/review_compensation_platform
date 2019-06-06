class CreateTipsReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :tips_reviews do |t|
      t.integer :user_id
      t.integer :review_id
      t.string :amount

      t.timestamps
    end
  end
end

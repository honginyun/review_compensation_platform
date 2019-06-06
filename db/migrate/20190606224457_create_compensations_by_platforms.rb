class CreateCompensationsByPlatforms < ActiveRecord::Migration[5.1]
  def change
    create_table :compensations_by_platforms do |t|
      t.float :compensation_amount
      t.integer :review_id
      t.boolean :compensated
      t.text :notes

      t.timestamps
    end
  end
end

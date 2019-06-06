class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :category
      t.integer :company_id
      t.string :serial_no

      t.timestamps
    end
  end
end

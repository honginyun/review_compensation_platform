class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.integer :review_id
      t.integer :commenter_id
      t.text :comment
      t.integer :comment_vote

      t.timestamps
    end
  end
end

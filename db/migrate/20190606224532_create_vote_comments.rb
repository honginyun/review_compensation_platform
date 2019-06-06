class CreateVoteComments < ActiveRecord::Migration[5.1]
  def change
    create_table :vote_comments do |t|
      t.integer :voter_id
      t.integer :comment_id

      t.timestamps
    end
  end
end

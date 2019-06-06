class AddVoteCommentCountToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :vote_comments_count, :integer
  end
end

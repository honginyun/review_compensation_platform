class AddVoteCommentCountToComments < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :vote_comments_count, :integer
  end
end

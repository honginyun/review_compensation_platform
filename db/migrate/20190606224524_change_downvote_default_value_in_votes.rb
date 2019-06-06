class ChangeDownvoteDefaultValueInVotes < ActiveRecord::Migration[5.1]
  def change
    change_column_default :votes, :downvote, '0'
  end
end

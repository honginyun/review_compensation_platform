class ChangeUpvoteDefaultValueInVotes < ActiveRecord::Migration[5.1]
  def change
    change_column_default :votes, :upvote, '0'
  end
end

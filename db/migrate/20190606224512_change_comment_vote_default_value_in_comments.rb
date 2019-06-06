class ChangeCommentVoteDefaultValueInComments < ActiveRecord::Migration[5.1]
  def change
    change_column_default :comments, :comment_vote, '0'
  end
end

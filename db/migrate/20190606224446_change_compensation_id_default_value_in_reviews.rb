class ChangeCompensationIdDefaultValueInReviews < ActiveRecord::Migration[5.1]
  def change
    change_column_default :reviews, :compensation_id, 'False'
  end
end

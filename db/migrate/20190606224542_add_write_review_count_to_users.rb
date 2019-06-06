class AddWriteReviewCountToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :write_review_count, :integer
  end
end

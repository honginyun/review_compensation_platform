class TipsReview < ApplicationRecord
  # Direct associations

  belongs_to :user

  belongs_to :review

  # Indirect associations

  # Validations

end

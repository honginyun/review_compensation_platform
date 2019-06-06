class Review < ApplicationRecord
  # Direct associations

  has_one    :compensations_by_platform

  has_many   :likes,
             :class_name => "Vote"

  has_many   :comments

  has_many   :tips_reviews

  # Indirect associations

  # Validations

end

class Review < ApplicationRecord
  # Direct associations

  has_many   :likes,
             :class_name => "Vote"

  has_many   :comments

  has_many   :tips_reviews

  # Indirect associations

  # Validations

end

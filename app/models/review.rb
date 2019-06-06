class Review < ApplicationRecord
  # Direct associations

  has_many   :comments

  has_many   :tips_reviews

  # Indirect associations

  # Validations

end

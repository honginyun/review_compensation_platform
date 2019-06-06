class Comment < ApplicationRecord
  # Direct associations

  belongs_to :commenter,
             :class_name => "User"

  belongs_to :review

  # Indirect associations

  # Validations

end

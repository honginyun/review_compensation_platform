class VoteComment < ApplicationRecord
  # Direct associations

  belongs_to :comment,
             :counter_cache => true

  belongs_to :voter,
             :class_name => "User",
             :counter_cache => true

  # Indirect associations

  # Validations

end

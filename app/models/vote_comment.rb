class VoteComment < ApplicationRecord
  # Direct associations

  belongs_to :voter,
             :class_name => "User",
             :counter_cache => true

  # Indirect associations

  # Validations

end

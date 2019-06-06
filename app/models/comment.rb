class Comment < ApplicationRecord
  # Direct associations

  has_many   :vote_comments,
             :dependent => :destroy

  belongs_to :commenter,
             :class_name => "User"

  belongs_to :review

  # Indirect associations

  # Validations

end

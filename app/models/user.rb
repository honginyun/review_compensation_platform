class User < ApplicationRecord
  # Direct associations

  has_many   :vote_comments,
             :foreign_key => "voter_id"

  has_many   :write_review,
             :class_name => "Review",
             :foreign_key => "reviewer_id"

  has_many   :likes,
             :class_name => "Vote",
             :dependent => :destroy

  has_many   :comments,
             :foreign_key => "commenter_id"

  has_many   :tips_reviews

  # Indirect associations

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

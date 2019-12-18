class Beginner < ApplicationRecord
  belongs_to :user
  has_many   :beginner_comments, dependent: :destroy
end

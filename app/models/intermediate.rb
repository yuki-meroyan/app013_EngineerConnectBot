class Intermediate < ApplicationRecord
  belongs_to :user
  has_many   :intermediates_comments, dependent: :destroy
end

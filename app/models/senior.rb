class Senior < ApplicationRecord
  belongs_to :user
  has_many   :senior_comments, dependent: :destroy
end

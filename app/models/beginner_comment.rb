class BeginnerComment < ApplicationRecord
  belongs_to :user
  belongs_to :beginner
end

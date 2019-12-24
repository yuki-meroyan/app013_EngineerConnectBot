class SeniorComment < ApplicationRecord
  belongs_to :user
  belongs_to :Senior
end

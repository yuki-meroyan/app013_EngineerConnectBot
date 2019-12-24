class PrivateMessage < ApplicationRecord
  belongs_to :user      , class_name: "User"
  belongs_to :send_user , class_name: "User"

  validates :user_id     , presence: true
  validates :send_user_id, presence: true
  validates :text        , presence: true

end

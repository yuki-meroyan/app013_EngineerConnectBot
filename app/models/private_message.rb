class PrivateMessage < ApplicationRecord
  belongs_to :user      , class_name: "User"
  belongs_to :send_user , class_name: "User"

  validates :user_id     , presence: true
  validates :send_user_id, presence: true
  validates :text        , presence: true

  def un_read_message_check(user_id, send_message_user_id)
    receive_user =PrivateMessage.where(user_id: send_message_user_id, send_user_id: user_id).count
    receive_user_checked_message = PrivateMessage.where(user_id: send_message_user_id, send_user_id: user_id, read_check: 1).count
    message_count = receive_user - receive_user_checked_message
    if 0 == message_count
    else
      # 未読メッセージが無い際に未読バッジを表示させないため
      message_count
      # content_tag(:div, message_count, class: 'private__message__box--unReadCount')
      # content_tag(:div, message_count, class: 'private__message__box--unReadCount')
      # content_tag(:div, content_tag(:p, message_count), class: 'private__message__box--unReadCount')
    end
  end
end

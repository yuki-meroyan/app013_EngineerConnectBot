class Group < ApplicationRecord
  has_many :group_users, dependent: :destroy
  has_many :users, through: :group_users
  has_many :group_messages

  def show_last_message
    if (last_message = group_messages.last).present?
      # 三項演算子の書き方
      # 条件式 ? trueの時の値 : falseの時の値
      last_message.text? ? last_message.text : '画像が投稿されています'
    else
      'まだメッセージはありません。'
    end
  end
end

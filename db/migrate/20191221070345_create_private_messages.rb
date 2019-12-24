class CreatePrivateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :private_messages do |t|
      t.text        :text                 , null: false
      t.boolean     :read_check           , default: 0
      t.integer     :user_id              , null: false
      t.integer     :send_user_id         , null: false
      t.integer     :user_delete_flg      , default: 0
      t.integer     :send_user_delete_flg , default: 0
      t.timestamps
    end
  end
end

class CreatePrivateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :private_messages do |t|
      t.text       :text    , null: false
      t.string     :image
      t.references :user    , null: false, foreign_key: true
      t.integer    :to_user , null: false
      t.timestamps
    end
  end
end

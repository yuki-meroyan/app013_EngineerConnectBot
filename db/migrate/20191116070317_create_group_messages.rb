class CreateGroupMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :group_messages do |t|
      t.text       :text  , null: false
      t.string     :image
      t.references :user  , null: false, foreign_key: true
      t.references :group , null: false, foreign_key: true
      t.timestamps
    end
  end
end

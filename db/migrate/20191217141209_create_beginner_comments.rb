class CreateBeginnerComments < ActiveRecord::Migration[5.2]
  def change
    create_table :beginner_comments do |t|
      t.text       :comment       , null: false
      t.references :user          , null: false, foreign_key: true
      t.references :beginner      , null: false, foreign_key: true
      t.timestamps
    end
  end
end

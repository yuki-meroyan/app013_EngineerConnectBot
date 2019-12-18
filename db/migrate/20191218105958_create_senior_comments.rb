class CreateSeniorComments < ActiveRecord::Migration[5.2]
  def change
    create_table :senior_comments do |t|
      t.text       :comment       , null: false
      t.references :user          , null: false, foreign_key: true
      t.references :senior        , null: false, foreign_key: true
      t.timestamps
    end
  end
end

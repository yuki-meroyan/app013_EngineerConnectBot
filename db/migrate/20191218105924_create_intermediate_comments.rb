class CreateIntermediateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :intermediate_comments do |t|
      t.text       :comment       , null: false
      t.references :user          , null: false, foreign_key: true
      t.references :intermediate  , null: false, foreign_key: true
      t.timestamps
    end
  end
end

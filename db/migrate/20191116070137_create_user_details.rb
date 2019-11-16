class CreateUserDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :user_details do |t|
      t.string     :family_name, null: false
      t.string     :first_name , null: false
      t.string     :address    ,               default: "日本"
      t.string     :level      , null: false , default: "初級者"
      t.string     :language   ,               default: ""
      t.text       :detail
      t.references :user , null: false, foreign_key: true
      t.timestamps
    end
  end
end

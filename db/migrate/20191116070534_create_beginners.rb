class CreateBeginners < ActiveRecord::Migration[5.2]
  def change
    create_table :beginners do |t|
      t.string    :title          , null: false
      t.string    :category       , null: false, default: ""
      t.string    :language       , null: false, default: ""                      # 開発言語
      t.text      :detail         , null: false
      t.timestamps
    end
  end
end

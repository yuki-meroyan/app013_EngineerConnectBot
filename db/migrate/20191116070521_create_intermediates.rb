class CreateIntermediates < ActiveRecord::Migration[5.2]
  def change
    create_table :intermediates do |t|
      t.string     :title          , null: false
      t.string     :category       , null: false, default: ""
      t.string     :language       , null: false, default: ""                      # 開発言語
      t.text       :detail         , null: false
      t.date       :entry_period   , null: false                                   # 申込期日
      t.date       :work_period    , null: false                                   # 開発期間
      t.integer    :recruit_member , null: false, default: 1                       # 募集人数
      t.references :user           , null: false, foreign_key: true
      t.timestamps
    end
  end
end

class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.string  :name         , null: false, unique: true, index: true
      t.integer :master       , null: false
      t.string  :master_name  , null: false
      t.text    :detail
      t.timestamps
    end
  end
end

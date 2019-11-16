class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.string  :name  , null: false, unique: true, index: true
      t.integer :master
      t.text    :detail
      t.timestamps
    end
  end
end

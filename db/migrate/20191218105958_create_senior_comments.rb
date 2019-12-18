class CreateSeniorComments < ActiveRecord::Migration[5.2]
  def change
    create_table :senior_comments do |t|

      t.timestamps
    end
  end
end

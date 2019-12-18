class CreateIntermediateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :intermediate_comments do |t|

      t.timestamps
    end
  end
end

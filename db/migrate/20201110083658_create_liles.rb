class CreateLiles < ActiveRecord::Migration[6.0]
  def change
    create_table :liles do |t|

      t.integer :item_id
      t.integer :user_id

      t.timestamps
      t.index [:user_id, :item_id], unique: true
    end
  end
end

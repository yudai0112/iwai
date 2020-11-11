class CreateBuys < ActiveRecord::Migration[6.0]
  def change
    create_table :buys do |t|

      t.timestamps
      t.string  :postal_code,        null: false #郵便番号
      t.integer :area_id,            null: false #都道府県
      t.string  :city,               null: false #市区町村
      t.string  :address,            null: false #番地
      t.string  :building #建物名
      t.string  :tel,                null: false #電話番号
      t.references :order,           null: false, foreign_key: true
    end
  end
end

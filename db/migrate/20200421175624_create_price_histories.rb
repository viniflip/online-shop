class CreatePriceHistories < ActiveRecord::Migration[5.1]
  def change
    create_table :price_histories do |t|
      t.references :product, foreign_key: true
      t.decimal :price, precision: 8, scale: 2

      t.timestamps
    end
  end
end

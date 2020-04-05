class CreateCartItems < ActiveRecord::Migration[5.1]
  def change
    create_table :cart_items do |t|
      t.references :product, foreign_key: true
      t.references :order, foreign_key: true
      t.references :cart, foreign_key: true
      t.decimal :price, precision: 8, scale: 2
      t.integer :quantity

      t.timestamps
    end
  end
end

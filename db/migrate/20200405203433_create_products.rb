class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :title
      t.string :description
      t.decimal :price, precision: 8, scale: 2
      t.datetime :deleted_at

      t.timestamps null: false
    end
    add_index :products, :deleted_at
  end
end

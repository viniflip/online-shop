class CreateShippingAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :shipping_addresses do |t|
      t.references :order, foreign_key: true
      t.string :name
      t.string :street
      t.integer :zip_code
      t.string :country
      t.string :email

      t.timestamps
    end
  end
end

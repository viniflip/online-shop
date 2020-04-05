class CreatePaymentDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :payment_details do |t|
      t.integer :account_number
      t.bigint :issuing_bank
      t.references :order, foreign_key: true

      t.timestamps
    end
  end
end

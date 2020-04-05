class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.string :status, default: 'waiting_for_payment'
      t.timestamps
    end
  end
end

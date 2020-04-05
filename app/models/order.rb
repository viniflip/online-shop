class Order < ApplicationRecord
  has_many :cart_items
  has_many :products, through: :cart_items
  has_one :shipping_address
  has_one :payment_detail

  enum status: {
    waiting_for_payment: 'waiting_for_payment',
    paid: 'paid'
  }
end

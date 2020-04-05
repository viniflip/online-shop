class Cart < ApplicationRecord
  has_many :items, class_name: 'CartItem', foreign_key: :cart_id
  has_many :products, through: :items
end

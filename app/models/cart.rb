class Cart < ApplicationRecord
  has_many :items, class_name: 'CartItem', foreign_key: :cart_id
  has_many :products, through: :items

  def cart_details
    {}.tap do |values|
      values[:amount] = 0
      values[:items] = 0
      items.each do |item|
        values[:amount] += item.price.to_f * item.quantity
        values[:items] += item.quantity
      end
      values
    end
  end
end

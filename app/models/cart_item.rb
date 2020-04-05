class CartItem < ApplicationRecord
  belongs_to :product
  belongs_to :order, optional: true
  belongs_to :cart

  def check_product
    if product.nil?
      Product.with_deleted.find product_id
    else
      product
    end
  end

end

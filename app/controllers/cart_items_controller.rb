class CartItemsController < ApplicationController
  before_action :set_product, only: :add_item
  before_action :set_cart_item, only: %i[destroy update]

  def add_item
    if @cart.products.include?(@product)
      @item = @cart.items.find_by(product: @product)
      @item.increment(:quantity, 1)
    else
      @item = CartItem.new(
        cart: @cart,
        product: @product,
        price: @product.price,
        quantity: 1
      )
    end

    if @item.save
      flash[:success] = "#{@product.title} added to cart successfully"
      redirect_to products_path
    else
      flash[:error] = "Error adding #{@product.title} to cart"
      redirect_to products_path
    end
  end

  def update
    if @cart_item.update(order_item_params)
      flash[:success] = "Quantity updated for #{@cart_item.product.title}"
      redirect_to carts_path
    else
      flash[:error] = "Error updating quantity for #{@cart_item.product.title}"
      redirect_to carts_path
    end
  end

  def destroy
    @cart_item.destroy!
    redirect_to carts_path
  end

  private
  def set_product
    @product = Product.find params[:product_id]
  end

  def set_cart_item
    @cart_item = CartItem.find params[:id]
  end

  def order_item_params
    params.require(:cart_item).permit(:quantity)
  end

end

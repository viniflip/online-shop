class ConfirmPaymentsController < ApplicationController
  include Concerns::Checkout
  before_action :current_step

  def index
  end

  def confirm
    @order.cart_items = @cart.items
    @order.status = :paid
    if @order.save
      session.delete(:order_id)
      session.delete(:cart_id)
      redirect_to orders_path
    else
      render :index
    end
  end
end

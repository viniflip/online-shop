class OrdersController < ApplicationController
  include Concerns::Checkout

  before_action :current_step

  def index
    @orders = Order.paid.order(created_at: :desc)
  end

  def create
    redirect_to new_shipping_address_path

  end
end

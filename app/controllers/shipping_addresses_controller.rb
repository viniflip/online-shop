class ShippingAddressesController < ApplicationController
  include Concerns::Checkout
  before_action :current_step

  def new
    if @order.shipping_address.present?
      redirect_to new_payment_detail_path
    else
      @shipping_address = @order.build_shipping_address
    end
  end

  def create
    @shipping_address = ShippingAddress.new(shipping_address_params)
    @shipping_address.order = @order
    if @shipping_address.save
      redirect_to new_payment_detail_path
    else
      render :new
    end
  end

  private
  def shipping_address_params
    params.require(:shipping_address).permit(:name, :email, :street, :zip_code, :country)
  end
end

class ShippingAddressesController < ApplicationController
  include Concerns::Checkout
  before_action :current_step
  before_action :set_shipping_address, only: %i[edit update]

  def new
    if @order.shipping_address.present?
      redirect_to new_payment_detail_path
    else
      @shipping_address = @order.build_shipping_address
    end
  end

  def edit
  end

  def update
    if @shipping_address.update(shipping_address_params)
      flash[:success] = "Shipping Address updated successfully"
      redirect_to confirm_payments_path
    else
      render :edit
    end
  end

  def create
    @shipping_address = ShippingAddress.new(shipping_address_params)
    if @shipping_address.save
      redirect_to new_payment_detail_path
    else
      render :new
    end
  end

  private
  def set_shipping_address
    @shipping_address = ShippingAddress.find params[:id]
  end

  def shipping_address_params
    params.require(:shipping_address).permit(:name, :order_id, :email, :street, :zip_code, :country)
  end
end

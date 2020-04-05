class PaymentDetailsController < ApplicationController
  include Concerns::Checkout
  before_action :current_step

  def new
    if @order.payment_detail.present?
      redirect_to confirm_payments_path
    else
      @payment_detail = @order.build_payment_detail
    end
  end

  def create
    @payment_detail = PaymentDetail.new(payment_detail_params)
    @payment_detail.order = @order
    if @payment_detail.save
      redirect_to confirm_payments_path
    else
      render :new
    end
  end

  private
  def payment_detail_params
    params.require(:payment_detail).permit(:account_number, :issuing_bank)
  end
end

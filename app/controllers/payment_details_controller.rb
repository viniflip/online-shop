class PaymentDetailsController < ApplicationController
  include Concerns::Checkout
  before_action :current_step
  before_action :set_payment_detail, only: %i[edit update]


  def new
    if @order.payment_detail.present?
      redirect_to confirm_payments_path
    else
      @payment_detail = @order.build_payment_detail
    end
  end

  def edit
  end

  def update
    if @payment_detail.update(payment_detail_params)
      flash[:success] = "Payment Details updated successfully"
      redirect_to confirm_payments_path
    else
      render :edit
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
  def set_payment_detail
    @payment_detail = PaymentDetail.find params[:id]
  end

  def payment_detail_params
    params.require(:payment_detail).permit(:account_number, :issuing_bank)
  end
end

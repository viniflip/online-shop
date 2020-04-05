module Concerns
  module Checkout
    def current_step
      if session[:order_id].present?
        @order = Order.find session[:order_id]
      else
        @order = Order.create
        session[:order_id] = @order.id
      end
    end
  end
end
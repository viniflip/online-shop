class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :current_cart

  private
  def current_cart
    if session[:cart_id].present?
      begin
        @cart = Cart.find session[:cart_id]
      rescue ActiveRecord::RecordNotFound
        session.delete(:cart_id)
        redirect_to products_path
      end
    else
      @cart = Cart.create
      session[:cart_id] = @cart.id
    end
  end
end

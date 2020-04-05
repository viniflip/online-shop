class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :current_cart

  private
  def current_cart
    if session[:cart_id].present?
      @cart = Cart.find session[:cart_id]
    else
      @cart = Cart.create
      session[:cart_id] = @cart.id
    end
  end
end

Rails.application.routes.draw do
  root 'products#index'

  resources :products
  resources :orders, only: %i[index create]
  resources :cart_items, only: %i[destroy update] do
    collection do
      post :add_item
    end
  end
  resources :carts, only: :index
  resources :shipping_addresses, only: %i[new create edit update]
  resources :payment_details, only: %i[new create edit update]
  resources :confirm_payments, only: :index do
    collection do
      post :confirm
    end
  end

end

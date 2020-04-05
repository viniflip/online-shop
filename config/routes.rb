Rails.application.routes.draw do
  root 'products#index'

  resources :products
  resources :cart_items, only: %i[destroy update] do
    collection do
      post :add_item
    end
  end
  resources :carts, only: :index

end

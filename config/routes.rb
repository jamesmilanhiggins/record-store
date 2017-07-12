Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  root to: 'albums#index'

  resources :accounts do
    resources :orders
  end

  resources :orders do
    resources :order_items
  end

  resources :albums do
    resources :songs
  end
end

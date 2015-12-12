Rails.application.routes.draw do

  authenticated :customer do
    root 'customers/home#index', as: :customer_root
  end

  authenticated :shop do
    root 'shops/home#index', as: :shop_root
  end

  root 'home#index'

  mount API::Base => '/api'

  devise_for :shops, controllers: {
    confirmations: 'shops/confirmations',
    passwords: 'shops/passwords',
    sessions: 'shops/sessions',
    unlocks: 'shops/unlocks'
  }
  devise_for :customers, controllers: {
    confirmations: 'customers/confirmations',
    passwords: 'customers/passwords',
    sessions: 'customers/sessions',
    unlocks: 'customers/unlocks'
  }
end

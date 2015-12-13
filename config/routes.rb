Rails.application.routes.draw do
  use_doorkeeper

  authenticated :customer do
    root 'customers/home#index', as: :customer_root
  end

  authenticated :shop do
    root 'shops/home#index', as: :shop_root
  end

  root 'home#index'

  devise_for :shops, controllers: {
    confirmations: 'shops/confirmations',
    registrations: 'shops/registrations',
    passwords: 'shops/passwords',
    sessions: 'shops/sessions',
    unlocks: 'shops/unlocks'
  }
  devise_for :customers, controllers: {
    confirmations: 'customers/confirmations',
    registrations: 'customers/registrations',
    passwords: 'customers/passwords',
    sessions: 'customers/sessions',
    unlocks: 'customers/unlocks'
  }

  mount API::Base => '/api'

  mount GrapeSwaggerRails::Engine => '/swagger'
end

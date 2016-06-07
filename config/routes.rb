Rails.application.routes.draw do
  namespace :admin do
    DashboardManifest::DASHBOARDS.each do |dashboard_resource|
      resources dashboard_resource
    end

    root controller: DashboardManifest::ROOT_DASHBOARD, action: :index
  end

  get 'hello_world', to: 'hello_world#index'
  use_doorkeeper

  authenticated :customer do
    root 'customers/home#index', as: :customer_root
    post 'update_card/:id', to: 'customers/cards#update'
    post 'delete_card/:id', to: 'customers/cards#destroy'
  end

  authenticated :shop do
    root 'shops/home#index', as: :shop_root
    get 'advertisements', to: 'shops/advertisements#index'
  end

  get 'advertisements', to: 'shops/advertisements#index'

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

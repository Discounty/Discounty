Rails.application.routes.draw do
  root 'home#index'

  mount API::Base => '/api'

  devise_for :shops
  devise_for :customers
end

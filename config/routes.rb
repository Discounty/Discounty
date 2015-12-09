Rails.application.routes.draw do
  root 'home#index'

  devise_for :shops
  devise_for :customers
end

Rails.application.routes.draw do
  devise_for :users
  resources :cards, only: [:index,:new, :create]
  root to: 'restaurants#index'
end

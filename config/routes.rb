Rails.application.routes.draw do
  devise_for :users
  root to: 'restaurants#index'
  resources :cards, only: [:index,:new, :create]
  resources :restaurants, only: [:index, :show] do
    resources :menus,only: [:index, :show]
  end
  namespace :admin do
    resources :restaurants do
      resources :menus
    end
  end
end

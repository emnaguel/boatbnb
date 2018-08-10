Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :boats do
    resources :bookings, only: [:create, :new]
  end


  get 'dashboard', to: 'pages#dashboard', as: 'dashboard'
  resources :bookings, only: [:show, :edit, :update, :destroy] do
    resources :reviews, only: [:show, :new, :create, :edit, :update, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

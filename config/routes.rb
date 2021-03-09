Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'


  resources :bicycles, shallow: true do
    resources :bookings, only: [ :new, :create, :show]
    resources :reviews, only: [:new, :create, :show]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end



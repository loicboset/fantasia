Rails.application.routes.draw do
  get 'profile', to: 'pages#profile'
  get 'characters/index'
  get 'characters/:id', to: 'characters#show'
  devise_for :users, except: [:show]
  root to: 'characters#index'

  resources :characters, except: [:destroy] do
    put :favorite, on: :member
  end

  post 'bookings', to: 'bookings#create'
  patch  "bookings/:id", to: "bookings#validate", as: :validate_booking
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

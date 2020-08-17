Rails.application.routes.draw do
  get 'characters/index'
  get 'characters/show'
  devise_for :users
  root to: 'pages#home'
  resources :characters, except: [:destroy] do

  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

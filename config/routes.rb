Rails.application.routes.draw do
  get 'characters/index'
  get 'characters/:id', to: 'characters#show'
  devise_for :users, except: [:show]
  root to: 'pages#home'
  resources :characters, except: [:destroy] do

  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

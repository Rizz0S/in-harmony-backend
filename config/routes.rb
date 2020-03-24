Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:create, :index]
  post '/login', to: 'users#login'
  get '/persist', to: 'users#persist'
  get '/profile', to: 'users#profile'
  post '/like', to: 'users#like_palette'
  post '/unlike', to: 'users#unlike_palette'

  resources :palettes, only: [:index, :create, :destroy]

end

Rails.application.routes.draw do
  resources :users
  resources :reviews
  resources :movies, only: [:index, :show]
  root 'application#welcome'
  get '/login' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  delete '/sessions' => 'sessions#destroy'
  get '/signup' => 'users#new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

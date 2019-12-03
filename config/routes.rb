Rails.application.routes.draw do
  resources :users
  resources :reviews
  resources :movies, only: [:index, :show]
  root 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

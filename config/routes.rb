Rails.application.routes.draw do
  resources :users
  resources :movie_reviews
  resources :movies, only: [:index, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

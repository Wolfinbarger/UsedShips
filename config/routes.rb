Rails.application.routes.draw do
  devise_for :users
  root to: "spaceships#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users do
    resources :bookings, only: :index
  end
  resources :spaceships do
    resources :bookings, only: %i[new show create]
    resources :spaceship_reviews, only: %i[new create edit destroy]
  end
end

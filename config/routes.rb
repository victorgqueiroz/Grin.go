Rails.application.routes.draw do
  devise_for :users
  resources :places
  root to: "pages#home"
  resources :profiles, only: [:show, :edit, :update]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

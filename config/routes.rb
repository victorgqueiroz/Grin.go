Rails.application.routes.draw do
  devise_for :users
  resources :places
  root to: "pages#index"

  resources :places, only: :show do
    resources :user, only: :index
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
#esinando o marge

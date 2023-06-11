Rails.application.routes.draw do
  devise_for :users
  resources :places
  root to: "pages#home"
  resources :users, only: [:show, :edit, :update] do
    resources :trips, only: [:new, :create, :edit]
    resources :matches, only: [:new, :create, :edit]
  end

  resources :trips, only: [:index, :show] do
    resources :reviews, only: [:create, :show, :index, :new]
  end

  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "/myprofile", to: "users#my", as: :my
  # Defines the root path route ("/")
  # root "articles#index"
end
#esinando o marge

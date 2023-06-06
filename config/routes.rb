Rails.application.routes.draw do
  devise_for :users
  resources :places
  root to: "pages#home"
  resources :profiles, only: [:show, :edit, :update]

  resources :trips, only: [:index, :show] do
    resources :reviews, only: [:create, :show, :index, :new]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "/myprofile", to: "profiles#my", as: :my
  # Defines the root path route ("/")
  # root "articles#index"
end

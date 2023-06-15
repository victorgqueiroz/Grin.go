Rails.application.routes.draw do
  devise_for :users
  resources :places
  root to: "pages#home"
  resources :profiles, only: [:show, :edit, :update]


  resources :trips, only: [:index, :show, :new, :create, :delete] do
    resources :reviews, only: [:create, :show, :index, :new]
  end

  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end

  resources :users, only: [] do
    resources :chatrooms, only: [:create]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "/myprofile", to: "profiles#my", as: :my
  # get "/myprofile/trip/new", to: "trips#new", as: :new_trip
  # Defines the root path route ("/")
  # root "articles#index"
end

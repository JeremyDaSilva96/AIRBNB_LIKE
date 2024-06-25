Rails.application.routes.draw do
  root to: "pages#home"

  devise_for :users

  resources :flats do
    resources :bookings, only: [:show, :new, :create]
  end

  resources :bookings, only: [:index, :destroy]

  # get "/about", to: "pages#about"
end

Rails.application.routes.draw do
  root to: "pages#home"

  devise_for :users

  resources :flats do
    resources :bookings, only: [:create, :new, :show]
  end

  resources :bookings, only: [:index, :destroy]

  # get "/about", to: "pages#about"
end

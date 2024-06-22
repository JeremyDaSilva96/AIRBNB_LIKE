Rails.application.routes.draw do
  root to: "pages#home"
  devise_for :users
  
  resources :flats

  # get "/about", to: "pages#about"
end

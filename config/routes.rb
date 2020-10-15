Rails.application.routes.draw do
  devise_for :users
  root "toppages#index"

  resources :mypages, only: [:index]
end

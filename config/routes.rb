Rails.application.routes.draw do
  devise_for :users, controllers: {   registrations: 'users/registrations',
                                      sessions: 'users/sessions' }
  root "toppages#index"

  resources :users, only: [:show, :edit, :update]

  resources :reviews, only: [:index, :show, :new, :create]

  resources :restaurants, only: [:index, :show, :new, :create]
  
  resources :ranks, only: [:index]
end

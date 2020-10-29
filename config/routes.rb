Rails.application.routes.draw do
  devise_for :users, controllers: {   registrations: 'users/registrations',
                                      sessions: 'users/sessions' }

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  root "toppages#index"

  resources :users, only: [:show, :edit, :update]

  resources :reviews, only: [:index, :show, :new, :create, :edit, :update]

  resources :restaurants, only: [:index, :show, :new, :create]

  resources :ranks, only: [:index]
end

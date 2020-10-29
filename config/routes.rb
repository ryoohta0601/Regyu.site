Rails.application.routes.draw do
  devise_for :users, controllers: {   registrations: 'users/registrations',
                                      sessions: 'users/sessions' }

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  root "toppages#index"

  resources :users, only: [:show, :edit, :update] do
    member do
      get :review
    end
  end

  resources :reviews do
    resources :likes, only: [:create, :destroy]
  end

  resources :restaurants, only: [:index, :show, :new, :create]

  resources :ranks, only: [:index]
end

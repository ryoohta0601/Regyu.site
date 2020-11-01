Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'browsing_histories/index'
  devise_for :users, controllers: {   registrations: 'users/registrations',
                                      sessions: 'users/sessions' }

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  root "toppages#index"

  resources :users, only: [:show, :edit, :update] do
    member do
      get :review
      get :bookmark
      get :like
    end
  end

  resources :reviews do
    resources :likes, only: [:create, :destroy]
  end

  resources :restaurants, only: [:index, :show, :new, :create] do
    resources :bookmarks, only: [:create, :destroy]
  end

  resources :ranks, only: [:index]

  resources :events
end

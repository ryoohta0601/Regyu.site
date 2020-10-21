Rails.application.routes.draw do
  devise_for :users, controllers: {   registrations: 'users/registrations',
                                      sessions: 'users/sessions' }
  root "toppages#index"

  resources :users, only: [:show, :edit, :update] do
    member do
      get :mypage
    end
  end

  resources :reviews, only: [:index, :show]

  resources :restaurants, only: [:index, :show, :new, :create]
  
  resources :ranks, only: [:index]
end

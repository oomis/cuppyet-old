require 'sidekiq/web'

Rails.application.routes.draw do
  
  resources :statuses
  resources :categories
  namespace :admin do
      resources :users
      resources :posts

      root to: "users#index"
    end
  
  get '/home', to: 'home#index'
  get '/privacy', to: 'home#privacy'
  get '/terms', to: 'home#terms'
    authenticate :user, lambda { |u| u.admin? } do
      mount Sidekiq::Web => '/sidekiq'
    end


  resources :notifications, only: [:index]
  resources :announcements, only: [:index]
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  
  resources :posts

  resources :posts do
    resources :likes
    resources :comments, only: [:create,:index, :destroy]
  end

  root to: 'posts#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

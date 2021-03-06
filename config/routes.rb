Rails.application.routes.draw do
  get 'comments/show'
  get 'test' => 'static_pages#test_page'

  devise_for :users, controllers: { registrations: 'registrations' }
  resources :hobbies
  resources :user_hobbies, only: [:create, :destroy]

  resources :posts do
    resources :comments, only: :new
    member do
      post :upvote
      post :downvote
    end
  end

  resources :users, only: [:show, :index]
  resources :relationships, only: [:create, :destroy]

  resources :comments, only: [:show, :create, :destroy, :edit, :update]
  
  resources :users do
    member do
      get :following, :followers
    end
  end
  
  root  'static_pages#index'

  get   'help'  => 'static_pages#help'
  get   'about' => 'static_pages#about'
  get   'fail'  => 'static_pages#fail_page'

  namespace :api, defaults: {format: :json} do
    resource  :sessions, only: [:create, :destroy]
    get 'signed_in' => 'sessions#signed_in'
    resources :hobbies
    resources :comments
    resources :users, only: [:show]
    resource :user_hobbies, only: [:create, :destroy]
    resources :posts do
      resources :comments, only: :new
      member do
        post :upvote
        post :downvote
      end
    end
  end
end
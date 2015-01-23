Rails.application.routes.draw do
  root 'static_pages#index'
  get 'help' => 'static_pages#help'
  get 'about' => 'static_pages#about'

  resources :users do
    member do
      get :hobbies
    end
  end
  resources :hobbies
  devise_for :users
end
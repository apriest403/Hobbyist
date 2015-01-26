Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :hobbies
  resources :user_hobbies,    only: [:create, :destroy]
  
  resources :users do
    member do
      get :hobbies
    end
  end
  
  root 'static_pages#index'
  get 'help' => 'static_pages#help'
  get 'about' => 'static_pages#about'
  
end
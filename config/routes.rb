Rails.application.routes.draw do
  resources :user, only: [:show, :index]
  
  resources :wikis

  resources :charges, only: [:new, :create]

  devise_for :users

  get 'about' => 'welcome#about'
  
  root 'welcome#index'
  
  resources :user do
    member do
      post :downgrade_account
    end
  end

end

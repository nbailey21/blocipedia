Rails.application.routes.draw do
  resources :user, only: [:show, :index]
  
  resources :wikis
  
  resources :wikis do
    resources :collaborators, only: [:create, :destroy]
  end
  
  resources :charges, only: [:new, :create]

  devise_for :users, :controllers => {:registrations => "registrations"}

  get 'about' => 'welcome#about'
  
  root 'welcome#index'
  
  resources :user do
    member do
      post :downgrade_account
    end
  end

end

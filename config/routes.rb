Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  delete 'sessions/destroy'
  post 'users/create'
  get 'users/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "tasks#index"
  
  get "signup", to: "users#new"
  
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  
  resources :tasks
  resources :users,only:[:index, :show, :new, :create]
  
end

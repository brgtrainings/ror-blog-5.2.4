Rails.application.routes.draw do
  root 'pages#home'

  resources :posts
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :users, except: [:new]
  resources :categories, except: [:destroy]
end

Rails.application.routes.draw do
  resources :profiles

  get '/confirm_email/:token', to: 'users#confirm_email'
  delete '/logout', to: 'sessions#destroy', as: 'logout'

  delete '/user/:id', to: 'users#destroy', as: 'user_destroy'

  post '/login', to: 'sessions#create', as: 'create_session'
  get '/login', to: 'sessions#login', as: 'login'

  get '/user/:id/edit', to: 'users#edit', as: 'edit_user'
  patch '/user/:id', to: 'users#update', as: 'update_user'
  get '/user/:id', to: 'users#show', as: 'user'
  get '/users', to: 'users#index'
  
  get '/signup', to: 'users#new', as: 'signup'
  post '/users', to: 'users#create', as: 'create_user'


  patch '/articles/:id', to: 'articles#update', as: 'update_article'
  post '/articles', to: 'articles#create'
  delete '/articles/:id', to: 'articles#destroy', as: 'article_destroy'
  get '/articles', to: 'articles#index'
  get '/articles/new', to: 'articles#new'
  get '/articles/:id', to: 'articles#show', as: 'article'
  get '/articles/:id/edit', to: 'articles#edit', as: 'edit_article'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
   root "pages#home"
end

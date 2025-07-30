Rails.application.routes.draw do

  delete '/logout', to: 'sessions#destroy', as: 'logout'

  get '/login', to: 'sessions#login', as: 'login'
  post '/login', to: 'sessions#create', as: 'create_session'

  get '/users', to: 'users#index'
  
  get '/signup', to: 'users#new', as: 'signup'
  post '/signup', to: 'users#create', as: 'create_user'


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

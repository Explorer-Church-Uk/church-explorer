Rails.application.routes.draw do
  resources :overseers
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'home#index'
  get '/', controller: :home,action: :index
  get '/about-us', controller: :home, action: :about
  get '/services', controller: :home, action: :services
  get '/weddings', controller: :home, action: :weddings
  get '/login', controller: :authentication, action: :login
end

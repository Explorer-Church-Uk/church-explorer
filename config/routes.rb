Rails.application.routes.draw do

  resources :users do
    resources :deacons
    resources :members
    resources :weddings
    resources :overseers
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'home#index'
  get '/', controller: :home,action: :index
  get '/about-us', controller: :home, action: :about
  get '/services', controller: :home, action: :services
  get '/wedding-info', controller: :home, action: :weddings
  get '/signup/:wedding',to: 'users#new'
  get '/signup',to: 'users#new'
  get '/login', controller: :authentication, action: :index
  post '/request-wedding', controller: :weddings,action: :request_wedding
end

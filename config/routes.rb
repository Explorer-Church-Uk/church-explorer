Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'home#index'
  get '/about-us', controller: :home, action: :about
  get '/services', controller: :home, action: :services
  scope '/authenticated' do
    get '/home', action: :index, controller: 'devise/home'
    get '/about', action: :about, controller: 'devise/home'
    get '/services', action: :services, controller: 'devise/home'
  end
end

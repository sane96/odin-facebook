Rails.application.routes.draw do
  root "posts#index"
  devise_for :users, :controllers => { registrations: 'registrations' }

  resources :users 
  resources :posts do
    resources :comments
    resources :likes
  end
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

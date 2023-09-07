Rails.application.routes.draw do
  root 'books#index'
  resources :books do
    resources :publishers
    resources :authors
  end

  resources :categories
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

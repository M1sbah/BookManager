Rails.application.routes.draw do
  # devise_for :users

  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', registration: '', sign_up: 'register' }, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations',
        passwords: 'users/passwords'
      }
  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
  end


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

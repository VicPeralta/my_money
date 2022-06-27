Rails.application.routes.draw do
  get 'categories/index'
  devise_for :users
  root 'splash#show'
  get 'splash/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

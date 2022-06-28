Rails.application.routes.draw do
  devise_for :users
  get '/categories/index', to: "categories#index"
  get '/categories/new', to: "categories#new", as: 'categories_new'
  post '/categories/new', to: "categories#create", as: 'categories_create'
  root 'splash#show'
  get 'splash/show'
end

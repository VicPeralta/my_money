Rails.application.routes.draw do
  get 'entity/index'
  devise_for :users
  get '/categories/index', to: "categories#index"
  get '/categories/new', to: "categories#new", as: 'categories_new'
  post '/categories/new', to: "categories#create", as: 'categories_create'
  get '/entities/index/:category_id', to: "entities#index"
  root 'splash#show'
  get 'splash/show'
end

Rails.application.routes.draw do
  get 'entity/index'
  devise_for :users
  get '/categories/index', to: "categories#index"
  get '/categories/new', to: "categories#new", as: 'categories_new'
  post '/categories/new', to: "categories#create", as: 'categories_create'
  get '/entities/index/:category_id', to: "entity#index"
  get '/entities/:entity_id', to: "entity#show", as: 'entity_detail'
  get '/entities/new/:category_id', to: "entity#new", as: 'entity_new'
  post '/entities/new', to: "entity#create", as: 'entity_create'
  root 'splash#show'
  get 'splash/show'
end

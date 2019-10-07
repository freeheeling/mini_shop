Rails.application.routes.draw do
  get '/merchants', to: 'merchants#index'
  get '/merchants/new', to: 'merchants#new'
  get '/merchants/:id', to: 'merchants#show'
  get '/merchants/:id/edit', to: 'merchants#edit'
  get '/merchants/:merchant_id/items', to: 'merchants#items_index'
  get '/merchants/:merchant_id/items/new', to: 'items#new'
  post '/merchants', to: 'merchants#create'
  post '/merchants/:merchant_id/items', to: 'items#create'
  patch '/merchants/:id', to: 'merchants#update'
  delete '/merchants/:id', to: 'merchants#destroy'

  get '/items', to: 'items#index'
  get '/items/:id', to: 'items#show'
  get '/items/:id/edit', to: 'items#edit'
  patch '/items/:id', to: 'items#update'
  delete '/items/:id', to: 'items#destroy'
end

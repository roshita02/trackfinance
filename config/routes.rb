Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'records#index'
  get '/records', to: 'records#index'

  get '/records/new', to: 'records#new', as: :new_record
  post '/records', to: 'records#create'

  get '/records/:id/', to: 'records#edit', as: :edit_record
  put '/records/:id', to: 'records#edit'
  patch '/records/:id/', to: 'records#update'

  delete '/records/:id/delete/', to: 'records#destroy', as: :record
#  delete '/records/:id/delete', to: 'records#destroy'

  resources :posts
end

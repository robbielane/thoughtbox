Rails.application.routes.draw do
get '/', to: 'sessions#new'
post '/login', to: 'sessions#create'
delete '/logout', to: 'sessions#destroy'

resources :users, only: [:new, :create]
resources :links, only: [:index, :create, :edit, :update]
end

Rails.application.routes.draw do
  get '/', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users, only: [:new, :create]
  resources :links, only: [:index, :create, :edit, :update, :destroy]

  namespace :api do
    namespace :v1 do
      resources :links, defaults: { format: :json } do
        member do
          patch 'toggle_read'
        end
      end
    end
  end
end

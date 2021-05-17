Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

    get '/', to: 'welcome#index'
    get '/franchisors', to: 'franchisors#index'
    get '/franchisors/new', to: 'franchisors#new'
    post '/franchisors', to: 'franchisors#create'
    get '/franchisors/:id', to: 'franchisors#show'
    get '/franchisors/:id/franchisees', to: 'franchisor_franchisees#index'
    get '/franchisors/:id/edit', to: 'franchisors#edit'
    patch '/franchisors/:id', to: 'franchisors#update'
    delete '/franchisors/:id', to: 'franchisors#destroy'

    get '/franchisees', to: 'franchisees#index'
    get '/franchisees/:id', to: 'franchisees#show'

    get '/facilities', to: 'facilities#index'
    get '/facilities/new', to: 'facilities#new'
    post '/facilities', to: 'facilities#create'
    get '/facilities/:id', to: 'facilities#show'

    get '/facilities/:id/licenses', to: 'facilities_licenses#index'

    get '/licenses', to: 'licenses#index'

    get '/facilities/:id/licenses/new', to: 'licenses#new'
    post '/facilities/:id/licenses/new', to: 'licenses#create'

    post '/facilities/:id/licenses', to: 'licenses#create'
end

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

    get '/', to: 'welcome#index'
    get '/franchisors', to: 'franchisors#index'
    get '/franchisors/new', to: 'franchisors#new'
    post '/franchisors', to: 'franchisors#create'
    get '/franchisors/:id', to: 'franchisors#show'
    get '/franchisors/:id/edit', to: 'franchisors#edit'
    patch '/franchisors/:id', to: 'franchisors#update'
    delete '/franchisors/:id', to: 'franchisors#destroy'

    get '/franchisors/:franchisor_id/franchisees', to: 'franchisor_franchisees#index'
    get '/franchisors/:franchisor_id/franchisees/new', to: 'franchisor_franchisees#new'
    post '/franchisors/:franchisor_id/franchisees', to: 'franchisor_franchisees#create'

    get '/franchisees', to: 'franchisees#index'
    get '/franchisees/:id', to: 'franchisees#show'
    get '/franchisees/:id/edit', to: 'franchisees#edit'
    patch '/franchisees/:id', to: 'franchisees#update'

    get '/facilities', to: 'facilities#index'
    post '/facilities', to: 'facilities#create'

    # #does not work if show is here with rails form
    # get '/facilities/:id', to: 'facilities#show'
    get '/facilities/:id/edit', to: 'facilities#edit'
    patch '/facilities/:id', to: 'facilities#update'
    delete '/facilities/:id', to: 'facilities#destroy'

    get '/facilities/new', to: 'facilities#new'
    # #does work if show is here with rails form
    get '/facilities/:id', to: 'facilities#show'

    get '/licenses', to: 'licenses#index'
    get '/licenses/:id', to: 'licenses#show'
    get '/licenses/:id/edit', to: 'licenses#edit'
    patch '/licenses/:id', to: 'licenses#update'
    delete '/licenses/:id', to: 'licenses#destroy'

    get '/facilities/:id/licenses', to: 'facilities_licenses#index'
    # post '/facilities/:id/licenses', to: 'facilities_licenses#index'
    get '/facilities/:id/licenses/new', to: 'facilities_licenses#new'
    post '/facilities/:id/licenses/new', to: 'facilities_licenses#create'

end

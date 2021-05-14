Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

    get '/', to: 'welcome#index'
    get '/franchisors', to: 'franchisors#index'
    get '/franchisors/:id', to: 'franchisors#show'
    get '/franchisees', to: 'franchisees#index'

    get '/facilities', to: 'facilities#index'
    post '/facilities', to: 'facilities#create'

    get '/facilities/:id', to: 'facilities#show'
    get '/facilities/:id/edit', to: 'facilities#edit'
    patch '/facilities/:id', to: 'facilities#update'

    get '/facilities/new', to: 'facilities#new'

    get '/licenses', to: 'licenses#index'
    get '/licenses/:id', to: 'licenses#show'

    get '/facilities/:id/licenses', to: 'facilities_licenses#index'

    get '/facilities/:id/licenses/new', to: 'licenses#new'
    post '/facilities/:id/licenses/new', to: 'licenses#create'

end

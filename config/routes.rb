Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

    get '/', to: 'welcome#index'
    get '/franchisors', to: 'franchisors#index'
    get '/franchisors/:id', to: 'franchisors#show'
    get '/franchisees', to: 'franchisees#index'

    get '/facilities', to: 'facilities#index'
    post '/facilities', to: 'facilities#create'

    #does not work if show is here with rails form
    # get '/facilities/:id', to: 'facilities#show'
    get '/facilities/:id/edit', to: 'facilities#edit'
    patch '/facilities/:id', to: 'facilities#update'

    get '/facilities/new', to: 'facilities#new'
    #does work if show is here with rails form
    get '/facilities/:id', to: 'facilities#show'

    get '/licenses', to: 'licenses#index'
    get '/licenses/:id', to: 'licenses#show'
    get '/licenses/:id/edit', to: 'licenses#edit'
    patch '/licenses/:id', to: 'licenses#update'

    get '/facilities/:id/licenses', to: 'facilities_licenses#index'

    get '/facilities/:id/licenses/new', to: 'facilities_licenses#new'
    post '/facilities/:id/licenses/new', to: 'facilities_licenses#create'

end

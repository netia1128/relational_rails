Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

    get '/', to: 'welcome#index'
    get '/facilities', to: 'facilities#index'
    get '/facilities/new', to: 'facilities#new'
    post '/facilities', to: 'facilities#create'
    get '/facilities/:id', to: 'facilities#show'
    get '/facilities/:id/licenses', to: 'facilities_licenses#index'
    get '/licenses', to: 'licenses#index'
    get '/facility/:id/licenses/new', to: 'licenses#new'
    post '/facility/:id/licenses/new', to: 'licenses#create'
    post '/licenses', to: 'licenses#create'
end

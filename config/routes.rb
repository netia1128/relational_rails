Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

    get '/', to: 'welcome#index'
    get '/facilities', to: 'facilities#index'
    get '/facilities/new', to: 'facilities#new'
    post '/facilities', to: 'facilities#create'
    get '/facilities/:id', to: 'facilities#see_details'
end

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

    get '/', to: 'welcome#index'

    get '/franchisors', to: 'franchisors#index'
    get '/franchisees', to: 'franchisees#index'
end

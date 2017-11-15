Rails.application.routes.draw do
  devise_for :users
  resources :api_keys

  resources :api_keys
  get '/api_keys/:id/form_duplicate/', to: 'api_keys#form_duplicate'
  post '/api_keys/find_duplicates/:id', to: 'api_keys#find_duplicates'
  root :to => "api_keys#index"

    namespace :api, defaults: { format: 'json' } do
        namespace :v1 do
            resources :api_keys do
                collection do
                    get '/find_duplicates', to: 'api_keys#find_duplicates'
                end
            end
        end
    end
end

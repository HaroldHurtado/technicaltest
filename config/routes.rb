Rails.application.routes.draw do
  devise_for :users
  resources :api_keys

  resources :api_keys
  get '/api_keys/:id/form_duplicate/', to: 'api_keys#form_duplicate'
  root :to => "api_keys#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

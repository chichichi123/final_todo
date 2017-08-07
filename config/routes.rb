Rails.application.routes.draw do

  resources :users

  resources :todo_lists do
    resources :todo_items
  end





  root "welcome#index"

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get "/auth/:provider/callback" => "sessions#create_from_omniauth"
  get '/joke', to: 'todo_lists#joke'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

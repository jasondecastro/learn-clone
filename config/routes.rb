Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :tracks
  resources :users
  resources :sessions

  get '/', to: 'sessions#new', as: 'root'
  get '/signup', to: 'users#new'
  delete '/signout', to: 'sessions#destroy'
  
end

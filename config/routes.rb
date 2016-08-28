Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :tracks
  resources :users
  resources :sessions
  resources :lessons

  get '/', to: 'sessions#new', as: 'root'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/signout', to: 'sessions#destroy'

end

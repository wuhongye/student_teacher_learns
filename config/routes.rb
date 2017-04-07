Rails.application.routes.draw do

  root 'users#new'
  get '/signup', to: 'users#new'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  delete '/room/destroy/:id', to: 'users#destroy_room', as: 'room_destroy'
  post '/room/new', to: 'users#create_room', as: 'room_create'


  resources :users
  resources :students
  resources :teachers
end

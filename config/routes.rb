Rails.application.routes.draw do
 root 'posts#index'

 resources :posts
 resources :registrations, only: [:new, :create]

 get '/login' => 'sessions#new'
 post '/login' => 'sessions#create'
 get '/logout' => 'sessions#destroy'
end

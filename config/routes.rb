Rails.application.routes.draw do
 root 'posts#index'

 resources :posts
 resources :registrations, only: [:new, :create]
end

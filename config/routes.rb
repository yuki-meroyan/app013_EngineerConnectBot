Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'engineer_connect_bots#top'
  get '/engineer_connect_bots/top', to: 'engineer_connect_bots#top'
  get '/engineer_connect_bots/search', to: 'engineer_connect_bots#search'
  get '/engineer_connect_bots/article', to: 'engineer_connect_bots#article'
  get '/engineer_connect_bots/have_group', to: 'engineer_connect_bots#have_group'
  resource  :user_details
  resources :users
  resources :beginners
  resources :intermediates
  resources :seniors
  resources :groups
end

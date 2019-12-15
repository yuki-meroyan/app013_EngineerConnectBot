Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'engineer_connect_bots#top'
  get '/engineer_connect_bots/top', to: 'engineer_connect_bots#top'
  get '/engineer_connect_bots/search', to: 'engineer_connect_bots#search'
  get '/engineer_connect_bots/user_menu', to: 'engineer_connect_bots#user_menu'
  get '/engineer_connect_bots/friend_menu', to: 'engineer_connect_bots#friend_menu'
  get '/engineer_connect_bots/group_menu', to: 'engineer_connect_bots#group_menu'
  get '/engineer_connect_bots/article_menu', to: 'engineer_connect_bots#article'
  get '/engineer_connect_bots/article_post', to: 'engineer_connect_bots#article_post'
  get '/engineer_connect_bots/article_mine', to: 'engineer_connect_bots#article_mine'
  get '/engineer_connect_bots/article_all', to: 'engineer_connect_bots#article_all'
  get '/engineer_connect_bots/have_group', to: 'engineer_connect_bots#have_group'

  resources :user_details
  resources :users do
    member do
      get :followed, :followers
    end
  end
  resources :beginners
  resources :intermediates
  resources :seniors
  resources :groups do
    resources :group_messages
  end
  resources :relationships, only: [:create, :destroy]
end

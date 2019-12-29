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
  get '/engineer_connect_bots/article_menu', to: 'engineer_connect_bots#article_menu'
  get '/engineer_connect_bots/article_post', to: 'engineer_connect_bots#article_post'
  get '/engineer_connect_bots/article_mine', to: 'engineer_connect_bots#article_mine'
  get '/engineer_connect_bots/article_all', to: 'engineer_connect_bots#article_all'
  get '/engineer_connect_bots/have_group', to: 'engineer_connect_bots#have_group'
  get '/engineer_connect_bots/message_lists', to: 'engineer_connect_bots#message_lists'
  #フォローとフォローを外すアクション
  put 'users/follow/:user_id' => 'users#follow'
  put 'users/unfollow/:user_id' => 'users#unfollow'

  #フォロー・フォロワーの一覧ページ
  get 'users/follow_list/:user_id' => 'users#follow_list'
  # get 'users/follower_list/:user_id' => 'users#follower_list'

  resources :user_details
  resources :users do
    member do
      get :followed, :followers
    end
    resources :private_messages
  end
  resources :beginners do
    resources :beginner_comments, only: [:index, :create]
  end
  resources :intermediates do
    resources :intermediate_comments, only: [:index, :create]
  end
  resources :seniors do
    resources :senior_comments, only: [:index, :create]
  end
  resources :groups do
    resources :group_messages
    namespace :api do
      resources :group_messages, only: :index, defaults: { format: 'json' }
    end
  end
end

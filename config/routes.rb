Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  get '/legal', to: 'pages#legal', as: 'legal'
  root to: 'pages#home'
  resources :movies, only: [:index, :new, :create, :show ]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

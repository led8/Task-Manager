Rails.application.routes.draw do
  get 'tasks/index'
  get 'tasks/show'
  devise_for :users
  root to: 'pages#home'

  resources :tasks, only: %i(index show)
end

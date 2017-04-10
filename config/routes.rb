Rails.application.routes.draw do
  devise_for :users
  resources :students
  resources :metaclasses
  resources :instructors, only: [:new, :create]
  resources :sessions, only: [:new, :create]

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

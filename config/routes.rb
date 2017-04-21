Rails.application.routes.draw do

  devise_for :users
  resources :students do
    member do
      get 'edit_notes'
      patch 'update_notes'
    end
  end

  resources :metaclasses do
    member do
      get 'new_student'
      patch 'save_student'
      get 'remove_student'
    end
  end

  resources :instructors, only: [:new, :create]
  resources :sessions, only: [:new, :create]
  resources :assignments
  resources :michiganscores, only: [:show, :new, :create, :edit, :update]

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

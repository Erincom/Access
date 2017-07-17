Rails.application.routes.draw do

  devise_for :users
  resources :students do
    member do
      get 'edit_notes'
      patch 'update_notes'
    end
  end

  resources :metaclasses do
    resources :lessons, only: [:show, :new, :create, :edit, :update, :destroy] do
      member do
        get 'new_student'
        patch 'save_student'
        get 'remove_student'
      end
    end
    member do
      get 'new_student'
      patch 'save_student'
      get 'remove_student'
      get 'edit_notes'
      patch 'update_notes'
    end
  end

  resources :instructors, only: [:new, :create]
  resources :sessions, only: [:new, :create]
  resources :assignments
  resources :michiganscores, only: [:show, :new, :create, :edit, :update]
  resources :student_metaclasses, only: [:edit, :update]
  resources :student_lessons, only: [:edit, :update]

  get '/all_reports' => 'pages#all_reports'
  get '/attendance_report' => 'reports#attendance_report'
  get '/progress_report' => 'reports#progress_report'
  get '/score_report' => 'reports#score_report'
  get '/signin_sheet' => 'reports#signin_sheet'

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

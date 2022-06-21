Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get '/my_applications', to: 'pages#my_applications'
  get '/my_pets', to: 'pages#my_pets'

  get '/profile', action: :show, controller: 'users'
  get '/profile/details', action: :edit, controller: 'users'
  patch '/profile', action: :update, controller: 'users'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :pets do
    resources :applications, except: [ :destroy, :show ]
  end

  resources :shelters
  resources :applications, only: [ :destroy, :show ]
  resources :users, only: [ :edit, :update, :show ]
  patch '/approve_application/:id', action: :approve_application, controller: 'applications', as: :approve_application
  patch '/unapprove_application/:id', action: :unapprove_application, controller: 'applications', as: :unapprove_application
  patch '/reject_application/:id', action: :reject_application, controller: 'applications', as: :reject_application
  patch '/unreject_application/:id', action: :unreject_application, controller: 'applications', as: :unreject_application
end

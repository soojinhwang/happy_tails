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
    resources :applications, except: [ :destroy, :index ]
  end

  resources :shelters
  resources :users, only: [ :edit, :update, :show ]
  resources :applications, only: [ :destroy, :index ]
end

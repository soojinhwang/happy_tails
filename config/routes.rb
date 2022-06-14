Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/profile', action: :show, controller: 'users'
  get '/profile/details', action: :edit, controller: 'users'
  patch '/profile', action: :update, controller: 'users'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :pets do
    resources :applications
  end

  resources :shelters
  resources :users, only: [ :edit, :update, :show ]
 # get 'users/:id/edit_bio', to: 'users#edit_bio'
  #patch 'users/:id', to: 'users#update'
end

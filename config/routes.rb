Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/my_applications', to: 'pages#my_application'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :pets do
    resources :applications, except: [ :destroy, :index ]
  end

  resources :shelters
  resources :applications, only: [ :destroy, :index ]

end

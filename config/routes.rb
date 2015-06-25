Rails.application.routes.draw do
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'logout' => 'sessions#destroy'
  get 'signup' => 'users#new'
  post 'signup' => 'users#create'

  resources :appointments

  get '/:year/:month/:day' => 'appointments#index', as: 'date'

  root 'sessions#new'
end

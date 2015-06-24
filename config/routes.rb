Rails.application.routes.draw do
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'logout' => 'sessions#destroy'

  resource :users
  resources :appointments

  get '/appointments/:year/:month/:day' => 'appointments#index', as: 'date'
end

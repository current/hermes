Rails.application.routes.draw do
  resource :users
  resources :appointments
  get '/appointments/:year/:month/:day' => 'appointments#index', as: 'date'
end

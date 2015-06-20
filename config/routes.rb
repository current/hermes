Rails.application.routes.draw do
  resources :appointments
  get '/appointments/:year/:month/:day' => 'appointments#index', as: 'date'
end

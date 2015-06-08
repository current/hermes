Rails.application.routes.draw do
  get '/calendar(/:year/:month/:day)' => 'calendars#show', as: 'calendar'
  resources :appointments, except: [:index]
end

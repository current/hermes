Rails.application.routes.draw do
  scope :calendar do
    get '/(:year(/:month(/:day)))' => 'calendars#show', as: 'calendar'
  end

  resources :appointments, except: [:index]
end

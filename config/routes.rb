Rails.application.routes.draw do
  scope :calendar do
    get '/' => 'calendars#day', as: 'today'
    get '/:year/:month' => 'calendars#month', as: 'month'
    get '/:year/:month/:day' => 'calendars#day', as: 'day'
  end

  resources :appointments
end

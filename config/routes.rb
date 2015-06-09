Rails.application.routes.draw do
  resources :appointments do
    get '/:year/:month/:day' => 'appointments#index', on: :collection
  end
end

Rails.application.routes.draw do
  get 'settings/edit'

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'logout' => 'sessions#destroy'

  get 'signup' => 'users#new'
  post 'signup' => 'users#create'

  get 'settings' => 'settings#edit'
  patch 'settings' => 'settings#update'

  resources :appointments do
    get :status, :on => :member
  end

  get 'reply' => 'appointments#reply'
  get 'today' => 'appointments#index'
  get ':year/:month/:day' => 'appointments#index', as: 'date'

  root 'sessions#new'
end

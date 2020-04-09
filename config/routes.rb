Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :profiles do
    member do
      get 'dashboard'
      get 'calendar'
    end
    resources :availabilities, only: [:index, :new, :create]
    resources :reasons, only: [:index, :new, :create]
  end

  resources :reasons, only: [:edit, :update, :destroy]
end

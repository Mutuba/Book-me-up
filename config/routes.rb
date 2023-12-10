Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    sessions: 'users/sessions',
  }

  # Other routes...
  root "home#index"

  get 'dashboard', to: 'dashboard#index'
end

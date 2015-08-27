Rails.application.routes.draw do

  devise_for :users, controllers: { 
    registrations: "users/registrations"
  }

  devise_scope :user do
    post '/trial-registration' => 'users/registrations#trial_registration'
  end

  namespace :users, path: "" do
    resources :missions
  end
  get '/successfully-registered', to: 'pages#successfully_registered'
  get '/already-registered', to: 'pages#already_registered'
  root 'pages#landing'
end

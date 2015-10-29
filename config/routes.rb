Rails.application.routes.draw do

  devise_for :users, controllers: { 
    registrations: "users/registrations",
    sessions: "users/sessions"
  }

  devise_scope :user do
    post '/trial-registration' => 'users/registrations#trial_registration'
  end

  namespace :users, path: "" do
    resources :missions
  end

  devise_for :admin, controllers: {
    registrations: "admin/registrations",
    sessions: "admin/sessions"
  }

  namespace :admin do
    get :dashboard, to: "base#dashboard"
    get "dashboard/missions", to: "base#missions"
  end
  get '/successfully-registered', to: 'pages#successfully_registered'
  get '/already-registered', to: 'pages#already_registered'
  root 'pages#landing'
end

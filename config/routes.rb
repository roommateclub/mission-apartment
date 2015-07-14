Rails.application.routes.draw do

  devise_for :users, controllers: { 
    registrations: "users/registrations"
  }

  devise_scope :user do
    post '/trial-registration' => 'users/registrations#trial_registration'
  end

  root 'pages#landing'
end

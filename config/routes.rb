Rails.application.routes.draw do
  root "home#index"

  resources :users,  :only => [:show, :index]
  resources :suggestions, :only => [:index]

  post "users/:user_id/favorites" => "users#favorite", as: :favorite
  delete "users/:user_id/favorites" => "users#destroy", as: :favorites

  get "/auth/spotify/callback" => "sessions#create"
  delete "/logout" => "sessions#destroy"

end

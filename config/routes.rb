Rails.application.routes.draw do
  root "home#index"

  resources :users,  :only => [:show, :index]
  resources :suggestions, :only => [:index]

  post "users/favorites/:suggestion_id" => "users#favorite", as: :favorite
  delete "users/favorites/:suggestion_id" => "users#destroy", as: :favorites

  get "/auth/spotify/callback" => "sessions#create"
  delete "/logout" => "sessions#destroy"

end

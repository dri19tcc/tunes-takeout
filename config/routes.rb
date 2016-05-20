Rails.application.routes.draw do
  root "home#index"

  resources :users #:only[:show, :index]
  resources :suggestions

  post "users/:user_id/favorites" => "users#favorite", as: :favorite
  get "/auth/spotify/callback" => "sessions#create"
  delete "/logout" => "sessions#destroy"

end

Rails.application.routes.draw do
  root "home#index"

  resources :users #:only[:show, :index]
  resources :suggestions

  get "/auth/spotify/callback" => "sessions#create"
  delete "/logout" => "sessions#destroy"

end

Rails.application.routes.draw do
  namespace :api do
    get "/users/:id" => "users#show"
    post "/users" => "users#create"
    post "/sessions" => "sessions#create"

    get "/photo_ones" => "photo_ones#index"
    post "/photo_ones" => "photo_ones#create"
    delete "/photo_ones/:id" => "photo_ones#destroy"
  end
end

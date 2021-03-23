Rails.application.routes.draw do
  namespace :api do
    get "/users" => "users#index"
    get "/users/:id" => "users#show"
    post "/users" => "users#create"
    patch "/users/:id" => "users#update"
    post "/sessions" => "sessions#create"

    get "/photo_ones" => "photo_ones#index"
    get "/photo_ones/:id" => "photo_ones#show"
    post "/photo_ones" => "photo_ones#create"
    patch "/photo_ones/:id" => "photo_ones#update"
    delete "/photo_ones/:id" => "photo_ones#destroy"

    get "/*path" => proc { [200, {}, [ActionView::Base.new.render(file: "public/index.html")]] }
  end
end

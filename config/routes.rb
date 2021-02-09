Rails.application.routes.draw do
  namespace :api do
    get "/users/:id" => "users#show"
  end
end

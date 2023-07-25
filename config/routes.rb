Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  get "data", to: "application#index"
  post "delete/:id", to: "application#delete"
end

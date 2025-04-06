Rails.application.routes.draw do
  # API defination
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, only: [ :show ]
    end
  end
  get "up" => "rails/health#show", as: :rails_health_check
end

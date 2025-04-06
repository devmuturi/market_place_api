Rails.application.routes.draw do
  # API defination
  namespace :api, defaults: { format: :json} do
    namespace :V1 do
    end
  end
  get "up" => "rails/health#show", as: :rails_health_check
end

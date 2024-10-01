Rails.application.routes.draw do
  # Devise routes for user authentication
  devise_for :users

  # RESTful routes for patients
  resources :patients

  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check

  # PWA routes
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Root route
  root "patients#index"
end
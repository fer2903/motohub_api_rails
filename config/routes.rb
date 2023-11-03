Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :brands
      resources :client_motorcycles
      resources :emergency_contacts
      resources :medical_informations
      resources :states
      resources :statuses
      resources :user_informations
      resources :users
      resources :show_motorcycles
      devise_scope :user do
        post "sign_up", to: "registrations#create"
        post "sign_in", to: "sessions#create"
        get "logout", to: "sessions#destroy"
      end
    end
  end
end

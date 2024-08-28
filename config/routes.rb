Rails.application.routes.draw do

  constraints subdomain: "#{ENV.fetch("TENANT1_NAME")}#{ENV.fetch("SUBROOT_DOMAIN")}".downcase do
    namespace :tenant1, path: "" do
      root to: "dashboard#index", as: "root"
      get "/auth/token", to: "token#index", as: "login"
      post "/auth/token", to: "token#create", as: "token"
    end
  end

  constraints subdomain: "#{ENV.fetch("TENANT2_NAME")}#{ENV.fetch("SUBROOT_DOMAIN")}".downcase do
    namespace :tenant2, path: "" do
      root to: "dashboard#index", as: "root"
      get "/auth/token", to: "token#index", as: "login"
      post "/auth/token", to: "token#create", as: "token"
    end
  end

  constraints subdomain: "api#{ENV.fetch("SUBROOT_DOMAIN")}".downcase do
    namespace :api, path: "" do
      get "/users", to: "users#index", as: "users"
      get "/user/:id", to: "users#show", as: "user"
    end
  end

  constraints(lambda { |req| req.subdomains.empty? || !req.subdomains.include?(Rails.configuration.tenant_subdomains) }) do
    root to: "application#not_found"
  end

  match "*path", to: "application#not_found", via: :all

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
end

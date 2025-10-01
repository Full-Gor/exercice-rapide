Rails.application.routes.draw do
  get "media/index"
  get "media/show"
  get "media/create"
  get "media/update"
  get "media/destroy#"
  get "media/1."
  get "media/Aller"
  get "media/dans"
  get "media/le"
  get "media/projet"
  get "media/Rails"
  get "comments/index"
  get "comments/show"
  get "comments/create"
  get "comments/update"
  get "comments/destroy"
  get "tags/index"
  get "tags/show"
  get "tags/create"
  get "tags/update"
  get "tags/destroy"
  get "articles/index"
  get "articles/show"
  get "articles/create"
  get "articles/update"
  get "articles/destroy"
  get "categories/index"
  get "categories/show"
  get "categories/create"
  get "categories/update"
  get "categories/destroy"
  get "users/index"
  get "users/show"
  get "users/create"
  get "users/update"
  get "users/destroy"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end

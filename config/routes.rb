Rails.application.routes.draw do
  root to: "application#home"

  get "apply/resume" => "users#resume_application", as: :apply_resume
  get "apply/:section" => "users#edit", as: :apply
  get "apply", to: redirect("apply/basic"), as: :apply_redirect
  get "countdown" => "countdowns#index"
  resources :users

  mount Sidekiq::Web => "/sidekiq"
end

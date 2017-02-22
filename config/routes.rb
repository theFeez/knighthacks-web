Rails.application.routes.draw do
  root to: "application#home"

  resources :registrations, only: %i(create)

  get "apply/resume" => "registrations#resume", as: :resume_registration
  get "apply/:section" => "registrations#edit", as: :apply
  get "apply" => redirect("apply/resume")
  resources :registrations

  get "countdown" => "countdowns#index"

  mount Sidekiq::Web => "/sidekiq"
end

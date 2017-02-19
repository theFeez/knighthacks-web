Rails.application.routes.draw do
  root to: "application#home"

  get "countdown" => "countdowns#index"
  get "registrations/:token/resume" => "registrations#resume"
  resources :users, only: [:create, :update]

  mount Sidekiq::Web => "/sidekiq"
end

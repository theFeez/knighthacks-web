Rails.application.routes.draw do
  root to: "application#home"

  get "countdown" => "countdowns#index"

  resources :users

  mount Sidekiq::Web => "/sidekiq"
end

Rails.application.routes.draw do
  root to: "application#home"

  get "countdown" => "countdowns#index"

  mount Sidekiq::Web => "/sidekiq"
end

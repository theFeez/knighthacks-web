Rails.application.routes.draw do
  get "countdown" => "countdowns#index"

  mount Sidekiq::Web => "/sidekiq"
end

Rails.application.routes.draw do
  resources :tickets, only: [:index, :show]

  namespace :api do
    namespace :v1 do
      resources :tickets, only: [:create]
    end
  end
end

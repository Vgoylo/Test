# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'tickets#index'
  resources :tickets, only: %i[index show]

  namespace :api do

    namespace :v1 do
      resources :tickets, only: %i[index create update show destroy search] do
        get 'search', on: :collection
      end
    end
  end
end

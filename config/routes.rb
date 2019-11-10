# frozen_string_literal: true

Rails.application.routes.draw do
  # doorkeeper routes
  use_doorkeeper do
    skip_controllers :applications, :authorized_applications
  end

  # api v1 routes
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      # user routes
      resources :users
      post 'users/sign_up', to: 'users#create'
    end
  end
end

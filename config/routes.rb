# frozen_string_literal: true

Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: { passwords: :'api/v1/passwords' }
  root to: redirect('/admin')

  get 'successful_changed_password', to: 'successful_changed_password#index'

  namespace :api do
    namespace :v1 do
      devise_for :users, defaults: { format: :json }
      resource :user_profile, only: %i[show update]
      resources :products, only: %i[show index]
      resources :categories, only: %i[show index]
    end
  end
end

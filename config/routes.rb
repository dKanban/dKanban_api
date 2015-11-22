require 'api_constraints'

Rails.application.routes.draw do

  root 'rails/welcome#index'

  mount SabisuRails::Engine => "/sabisu_rails"


  namespace :api do
      namespace :v1, defaults: {format: :json } do

      resources :sessions, :only => [:create, :destroy]

      resources :demands, :only => [:show, :update, :index, :create] do

        resources :comments, :only => [:show, :create, :destroy,:index]

        resources :activitys, :only => [:show, :create, :index]

      end

      resources :users, :only => [:index, :show, :create, :update, :destroy]

      devise_for :users

      end

  end
end

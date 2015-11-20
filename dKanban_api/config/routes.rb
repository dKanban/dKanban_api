require 'api_constraints'

Rails.application.routes.draw do

  root 'rails/welcome#index'

  mount SabisuRails::Engine => "/sabisu_rails"


  namespace :api, defaults: {format: :json } do

    scope module: :v1 , constraints: ApiConstraints.new(version: 1, default: true) do


      resources :sessions, :only => [:create, :destroy]
      resources :physical_persons, :only => [:show]
      resources :events, :only => [:show, :index] do
        collection do
          post :have_possible_new_event_in_my_location_round
        end
      end

      resources :user_locations, :only => [:index, :show] do
        collection do
          get :last_locations_in_round
          get :last_locations
        end
      end

      resources :users, :only => [:index, :show, :create, :update, :destroy] do

        resources :physical_persons, :only => [:create, :update]
        resources :routes, :only => [:show, :create, :destroy, :update, :index]
        resources :events, :only => [:create,:destroy,:update]

        resources :user_locations, :only => [:create] do
          collection do
            get :user_last_location
            get :user_locations_history
          end
        end

      end

      devise_for :users

    end
  end


end
require 'api_constraints'

Rails.application.routes.draw do

  root 'rails/welcome#index'

  mount SabisuRails::Engine => "/sabisu_rails"


  namespace :api, defaults: {format: :json } do

    scope module: :v1 , constraints: ApiConstraints.new(version: 1, default: true) do


      resources :sessions, :only => [:create, :destroy]

      resources :demands, :only => [:show, :update, :index]



      resources :users, :only => [:index, :show, :create, :update, :destroy] do

        resources :demands, :only => [:create] do
          collection do
            get :my_developed_demands
            get :my_requested_demands
          end
        end

      end

      devise_for :users

    end
  end


end
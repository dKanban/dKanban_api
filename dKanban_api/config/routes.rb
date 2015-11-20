require 'api_constraints'

Rails.application.routes.draw do

  root 'rails/welcome#index'

  mount SabisuRails::Engine => "/sabisu_rails"


  namespace :api, defaults: {format: :json } do

    scope module: :v1 , constraints: ApiConstraints.new(version: 1, default: true) do


      resources :sessions, :only => [:create, :destroy]




      resources :users, :only => [:index, :show, :create, :update, :destroy] do


      end

      devise_for :users

    end
  end


end
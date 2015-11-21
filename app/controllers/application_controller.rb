class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  respond_to :json

  protect_from_forgery with: :null_session

  include Authenticable


  def render_missing_params_message
    render json: {errors: "Missing params" }, status: 422
  end

end

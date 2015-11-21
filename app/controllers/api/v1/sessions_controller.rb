class Api::V1::SessionsController < ApplicationController

  def create
    user_password = params[:user][:password]
    user_email = params[:user][:email]
    user = user_email.present? && User.find_by(email: user_email)

    if user.valid_password? user_password
      sign_in user, store: false
      user.generate_authentication_token!
      user.save
      render json: user, status: 200, location: [:api,:v1,user]
    else
      render json: {errors: "Invalid email or password"}, status: 422
    end
  end

end

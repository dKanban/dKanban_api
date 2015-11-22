class Api::V1::SessionsController < ApplicationController

  # def create
  #
  #   respond_to do |format|
  #       format.html { super }
  #       format.json do
  #
  #     user_password = params[:user][:password]
  #     user_email = params[:user][:email]
  #     user = user_email.present? && User.find_by(email: user_email)
  #
  #     if user.valid_password? user_password
  #
  #       sign_in user, store: false
  #       user.generate_authentication_token!
  #       user.save
  #       render json: user, status: 200, location: [:api,:v1,user]
  #     else
  #       render json: {errors: "Invalid email or password"}, status: 422
  #     end
  #   end
  #   end
  # end

  def create
      respond_to do |format|
        format.html { super }
        format.json do
          user_password = params[:user][:password]
          user_email = params[:user][:email]
          user = user_email.present? && User.find_by(email: user_email)

          if user.valid_password? user_password

            sign_in user, store: false
            user.generate_authentication_token!
            user.save
            @data = {
              auth_token: user.auth_token,
              email: user.email
            }
            render json: @data.to_json, status: 200, location: [:api,:v1,user]
          else
            render json: {errors: "Invalid email or password"}, status: 422
          end
        end
      end
    end

    private
    def auth_options
      params.require(:user).permit(:password, :email, :client_owner_id, :developer_owner_id,:status,:priority)
    end

end

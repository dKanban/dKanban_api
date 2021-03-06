class Api::V1::UsersController < ApplicationController
  before_action :authenticate_with_token!, only: [:update, :destroy]
  respond_to :json

  def create
    user = User.new(user_params)
    if user.save
      render json: user, status: 201, location: [:api,:v1,user]
    else
      render json: { errors: user.errors }, status: 422
    end
  end

  def show
    current_user =  User.find(params[:id])

    render json: {users: current_user } , status: 201

  end

  def index
    all_users = User.all.limit(1000)

    render json: {users: all_users } , status: 201

  end

  def update

    user = current_user

    if user.update(user_params)
      render json: user, status: 200, location: [:api,:v1,user]
    else
      render json: {errors: user.errors}, status: 422
    end
  end

  def destroy
    current_user.destroy
    head 204
  end

  private

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation,:full_name,:profile_type)
    end


end

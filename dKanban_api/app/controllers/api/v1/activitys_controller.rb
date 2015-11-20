class Api::V1::ActivitysController < ApplicationController

  before_action :authenticate_with_token!, only: [:create,:show,:index]
  respond_to :json


  def show
    respond_with Activity.find(params[:id])
  end

  def create

    new_activity = Activity.create(activity_params)
    if new_activity.save
      render json: new_activity, status: 201
    else
      render json: { errors: new_activity.errors }, status: 422
    end
  end


  def index
    demand = Demand.find(params[:demand_id])
    respond_with demand.activities
  end


  private

  def activity_params
    params.require(:activity).permit(:description, :activity_type, :demand_id)
  end


end

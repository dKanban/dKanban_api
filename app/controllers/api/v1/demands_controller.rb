class Api::V1::DemandsController < ApplicationController

  before_action :authenticate_with_token!, only: [:create, :my_demands]
  respond_to :json

  def index
    @demands = Demand.all
    render json: {demands: @demands, comments: Comment.all, activities: Activity.all, users: User.all}, methods: [:comment_ids, :activity_ids]
  end

  def show
    demand =  Demand.find(params[:id])

    render json: {demands: demand}, status: :created, location: [:api,:v1,demand]

  end

  def create

    demand = current_user.developed_demands.build(demand_params)

    if demand.save
      render json: {demands: demand}, status: :created, location: [:api,:v1,demand]
    else
      render json: { errors: demand.errors }, status: 422
    end
  end

  def update
    demand = Demand.find(params[:id])
    if demand.update(demand_params)
      render json: {demands: demand}, status: 200, location: [:api,:v1,demand]
    else
      render json: { errors: demand.errors }, status: 422
    end
  end

  private

  def demand_params
    params.require(:demand).permit(:title, :description, :client_owner_id, :developer_owner_id,:status,:priority)
  end


end

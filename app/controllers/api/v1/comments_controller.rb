class Api::V1::CommentsController < ApplicationController

  before_action :authenticate_with_token!, only: [:create,:destroy,:update,:index]
  respond_to :json


  def show
    respond_with Comment.find(params[:id])
  end

  def create

    new_comment = current_user.comments.build(comment_params)
    if new_comment.save
      render json: new_comment, status: 201
    else
      render json: { errors: new_comment.errors }, status: 422
    end
  end

  def destroy

    comment = Comment.find(params[:id])
    comment.destroy
    head 204
  end

  def index
    demand = Demand.find(params[:demand_id])
    respond_with demand.comments
  end


  private

  def comment_params
    params.require(:comment).permit(:content, :attatchment, :demand_id, :user_owner_id)
  end


end

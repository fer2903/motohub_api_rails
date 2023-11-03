class Api::V1::StatusesController < ApplicationController
  #before_action :authenticate_user!

  def index
    statuses = Status.all
    render json: statuses, each_serializer: Api::V1::StatusSerializer
  end

  def create
    statuses = Status.new permit_params
    if statuses.save
      render json: {
        status: "success",
        message: "Successfully create brand",
        data: ActiveModelSerializers::Adapter::Json.new(Api::V1::StatusSerializer.new(statuses)).as_json,
      }, status: :ok
    else
      render json: {
        status: "error",
        message: "An error occurred to create brand",
        errors: statuses.errors,
      }, status: :unprocessable_entity
    end
  end
  private

  def permit_params
    params[:params].permit(:name, :var_name, :flag)
  end
end

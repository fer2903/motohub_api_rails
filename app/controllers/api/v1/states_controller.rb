class Api::V1::StatesController < ApplicationController
  #before_action :authenticate_user!

  def index
    statates = State.all
    render json: statates, each_serializer: Api::V1::StateSerializer
  end

   def create
    state = State.new permit_params
    if state.save
      render json: {
        status: "success",
        message: "Successfully create brand",
        data: ActiveModelSerializers::Adapter::Json.new(Api::V1::StateSerializer.new(state)).as_json,
      }, status: :ok
    else
      render json: {
        status: "error",
        message: "An error occurred to create brand",
        errors: state.errors,
      }, status: :unprocessable_entity
    end
  end

  private
  def permit_params
    params[:params].permit(:name, :var_name)
  end
end

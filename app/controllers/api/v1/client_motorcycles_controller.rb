class Api::V1::ClientMotorcyclesController < ApplicationController

  #before_action :authenticate_user!

  def index
    motor = current_user.motorcycles
    render json: motor, each_serializer: MotorcycleSerializer
  end

  def create
    motorcycle = current_user.motorcycles.new permit_params
    if motorcycle.save
      render json: {
        status: "success",
        message: "Successfully create motorcycle",
        data: ActiveModelSerializers::Adapter::Json.new(MotorcycleSerializer.new(motorcycle)).as_json,
      }, status: :ok
    else
      render json: {
        status: "error",
        message: "An error occurred to create motorcycle",
        errors: motorcycle.errors,
      }, status: :unprocessable_entity
    end
  end

  def update
    motorcycle = Motorcycle.find(params[:id])
    if motorcycle.update(permit_params)
      render json: {
        status: "success",
        message: "Successfully create motorcycle",
        data: ActiveModelSerializers::Adapter::Json.new(MotorcycleSerializer.new(motorcycle)).as_json,
      }, status: :ok
    else
      render json: {
        status: "error",
        message: "An error occurred to create motorcycle",
        errors: motorcycle.errors,
      }, status: :unprocessable_entity
    end
  end

  private

  def permit_params
    params[:params][:values].permit( :state_id, 
                            :brand_id,
                            :status_id,
                            :year,
                            :serial,
                            :plates,
                            :mileage,
                            :invoice_number,
                            :model,
                            :description,
                            :color,
                            :image,
                            :serial_image,
                            :engine,
                            :cilinder,
                            :submarca,
                            :insurance,
                            :policy,
                            :is_a_driver,
                            :driver_name,
                            :report_number)
  end
end

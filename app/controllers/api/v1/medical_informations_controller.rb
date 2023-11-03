class Api::V1::MedicalInformationsController < ApplicationController

  #before_action :authenticate_user!

  def index
    medical = MedicalInformation.all
    render json: medical, each_serializer: Api::V1::MedicalInformationSerializer
  end

  def create
    medical = MedicalInformation.new(permit_params)
    if medical.save
      render json: {
        status: "success",
        message: "Successfully create brand",
        data: ActiveModelSerializers::Adapter::Json.new(Api::V1::MedicalInformationSerializer.new(medical)).as_json,
      }, status: :ok
    else
      render json: {
        status: "error",
        message: "An error occurred to create brand",
        errors: medical.errors,
      }, status: :unprocessable_entity
    end
  end

  private
  def permit_params
    params[:params].permit(:nss,
              :blood_type,
              :allergies,
              :donor,
              #:user_information_id)
    )
  end
end

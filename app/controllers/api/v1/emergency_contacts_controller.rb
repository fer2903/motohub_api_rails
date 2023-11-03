class Api::V1::EmergencyContactsController < ApplicationController
  #before_action :authenticate_user!

  def index
    emergency = EmergencyContact.all
    render json: emergency, each_serializer: Api::V1::EmergencyContactSerializer
  end

  def create
    emergency = EmergencyContact.new permit_params
    if emergency.save
      render json: {
        status: "success",
        message: "Successfully create brand",
        data: ActiveModelSerializers::Adapter::Json.new(Api::V1::EmergencyContactSerializer.new(emergency)).as_json,
      }, status: :ok
    else
      render json: {
        status: "error",
        message: "An error occurred to create brand",
        errors: emergency.errors,
      }, status: :unprocessable_entity
    end
  end

  private
  def permit_params
    params[:params][:values].permit(
                            :name, 
                            :relationship, 
                            :cel, 
                            #:user_information_id
    )
  end
end
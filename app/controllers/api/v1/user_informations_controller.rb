class Api::V1::UserInformationsController < ApplicationController
  #before_action :authenticate_user!

  def index
    user_info = UserInformation.all
    render json: user_info, each_serializer: Api::V1::UserInformationSerializer
  end

  def create
    if current_user.user_information.nil? 
      user_info = UserInformation.new permit_params.merge(user_id:current_user.id)
      if user_info.save
        render json: {
          status: "success",
          message: "Successfully create brand",
          data: ActiveModelSerializers::Adapter::Json.new(Api::V1::UserInformationSerializer.new(user_info)).as_json,
        }, status: :ok
      else
        render json: {
          status: "error",
          message: "An error occurred to create brand",
          errors: user_info.errors,
        }, status: :unprocessable_entity
      end
    else
      user_info = current_user.user_information.update(permit_params)
      user_uodated = current_user.user_information
      if user_info
        render json: {
          status: "success",
          message: "Successfully create brand",
          data: ActiveModelSerializers::Adapter::Json.new(Api::V1::UserInformationSerializer.new(user_uodated)).as_json,
        }, status: :ok
      else
        render json: {
          status: "error",
          message: "An error occurred to create brand",
          errors: user_uodated.errors,
        }, status: :unprocessable_entity
      end
    end
  end

  private
  def permit_params
    params[:params][:values].permit(
                                    :full_name,
                                    :last_name,
                                    :address,
                                    :state_id,
                                    :user_type,
                                    :year_of_birth,
                                    :motoclub,
                                    :photo )
  end
end

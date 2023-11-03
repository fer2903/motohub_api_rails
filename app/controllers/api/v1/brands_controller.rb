class Api::V1::BrandsController < ApplicationController
  #before_action :authenticate_user!

  def index
    brands = Brand.all
    render json: brands, each_serializer: Api::V1::BrandCatalogueSerializer
  end

  def create
    brand = Brand.new permit_params
    if brand.save
      render json: {
        status: "success",
        message: "Successfully create brand",
        data: ActiveModelSerializers::Adapter::Json.new(Api::V1::BrandCatalogueSerializer.new(brand)).as_json,
      }, status: :ok
    else
      render json: {
        status: "error",
        message: "An error occurred to create brand",
        errors: brand.errors,
      }, status: :unprocessable_entity
    end
  end

  private
  def permit_params
    params.permit(:name)
  end
end

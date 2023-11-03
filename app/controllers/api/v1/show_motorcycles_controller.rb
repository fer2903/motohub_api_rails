class Api::V1::ShowMotorcyclesController < ApplicationController


  def index
    motor = search_by_term(params[:q])
    render json: motor, each_serializer: MotorcycleSerializer
  end

  private

  def search_by_term(term)
    search_key = "%#{term}%"
    client_motorcycles= Motorcycle.arel_table
    result = Motorcycle.where(client_motorcycles[:serial].matches(search_key).or(client_motorcycles[:plates].matches(search_key)))
  end
end

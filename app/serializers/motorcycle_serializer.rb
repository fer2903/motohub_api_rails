class MotorcycleSerializer < Api::V1::ApplicationSerializer
  attributes  :id,
              :state_id, 
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
              :report_number,
              :created_at
=begin
  def image
    if object.photo.attached?
      {
        url: rails_blob_url(object.photo)
      }
    end
  end
=end
end

class Api::V1::UserInformationSerializer < Api::V1::ApplicationSerializer
  attributes  :id,
              :user_id,
              :full_name,
              :last_name,
              :address,
              :state_id,
              :user_type,
              :year_of_birth,
              :motoclub,
              :photo,
              :created_at

  def photo
    if object.photo.attached?
      {
        url: rails_blob_url(object.photo)
      }
    end
  end
end

class Api::V1::MedicalInformationSerializer < Api::V1::ApplicationSerializer
  attributes  :id,
              :nss,
              :blood_type,
              :allergies,
              :donor,
              :user_information_id,
              :created_at

end

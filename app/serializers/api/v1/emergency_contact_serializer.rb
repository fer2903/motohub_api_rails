class Api::V1::EmergencyContactSerializer < Api::V1::ApplicationSerializer
  attributes  :id,
              :name,
              :relationship,
              :cel,
              :user_information_id,
              :created_at
end

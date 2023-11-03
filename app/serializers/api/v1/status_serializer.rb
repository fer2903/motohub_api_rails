class Api::V1::StatusSerializer < Api::V1::ApplicationSerializer
  attributes  :id,
              :name,
              :var_name,
              :created_at

end

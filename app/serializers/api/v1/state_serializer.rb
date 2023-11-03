class Api::V1::StateSerializer < Api::V1::ApplicationSerializer
  attributes  :id,
              :name,
              :var_name,
              :created_at

end

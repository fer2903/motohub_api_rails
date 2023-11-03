class EmergencyContact < ApplicationRecord
  belongs_to :user_information, optional: true
end

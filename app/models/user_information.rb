class UserInformation < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :state, optional: true
  has_many :emergency_contacts, dependent: :destroy
  has_many :medical_informations, dependent: :destroy
  has_many :motorcycles, through: :user, dependent: :destroy
  #has_one_attached :photo
end

class State < ApplicationRecord
  has_many :motorcycles, dependent: :destroy
  has_many :user_informations, dependent: :destroy
end

class Brand < ApplicationRecord
  has_many :motorcycles, dependent: :destroy
end
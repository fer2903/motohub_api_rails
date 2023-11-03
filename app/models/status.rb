class Status < ApplicationRecord
  has_many :motorcycles, dependent: :destroy
end

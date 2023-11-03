class ClientMotorcycle < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :state, optional: true
  belongs_to :brand, optional: true
  belongs_to :status, optional: true
  has_one :user_information, through: :user, dependent: :destroy
  #has_one_attached :image
  validates :plates, :serial, presence: true
  validates :plates, :serial, uniqueness: { case_sensitive: false }
  before_save :downcase_values

  def downcase_values
    plates.upcase!
    serial.upcase!
  end
end

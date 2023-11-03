class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :user_information, dependent: :destroy
  has_many :motorcycles, dependent: :destroy
  has_many :medical_informations, through: :user_information, dependent: :destroy
  has_many :emergency_contacts, through: :user_information, dependent: :destroy
  enum user_type: [ :admin, :client ]
  acts_as_token_authenticatable
end
class ShelterInfo < ApplicationRecord
  belongs_to :user
  has_many :pets, dependent: :destroy
  has_many :applications, dependent: :destroy


  validates :name, presence: true
  validates :name, length: { minimum: 2}
end

class Shelter < ApplicationRecord
  belongs_to :user
  has_many :pets, dependent: :destroy
  has_many :applications, through: :pets

  validates :name, presence: true, length: { minimum: 2 }
  validates :address, presence: true
  validates :description, presence: true, length: { minimum: 10 }
end

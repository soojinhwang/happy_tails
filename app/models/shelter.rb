class Shelter < ApplicationRecord
  belongs_to :user
  has_many :pets, dependent: :destroy
  validates :name, presence: true, length: { minimum: 2 }
  validates :address, presence: true
end

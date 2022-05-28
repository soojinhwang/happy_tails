class ShelterInfo < ApplicationRecord
  belongs_to :user
  has_many :pets, dependent: :destroy



  validates :name, presence: true
  validates :name, length: { minimum: 2}
  validates :address, presence: true
  validates :user_id, presence: true
end

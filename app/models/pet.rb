class Pet < ApplicationRecord
  belongs_to :shelter
  has_many :applications
  has_many_attached :photos

  validates :name, presence: true, length: { minimum: 2 }
  validates :description, presence: true, length: { minimum: 7 }
  validates :shelter_id, presence: true
  validates :adoption_status, presence: true, inclusion: { in: ["Available", "Reserved", "Adopted"] }
  validates :species, presence: true, inclusion: { in: ["Cat", "Dog"],
                                                   message: "Only Cats or Dogs (for now!)" }
  validates :breed, presence: true
  validates :sex, presence: true, inclusion: { in: ["Male", "Female"] }
  validates :age, presence: true
  validates :colour, presence: true
  validates :outdoor_space, inclusion: { in: [true, false] }
  validates :pet_friendly, presence: true
  validates :children_friendly, presence: true
  validates :hours_alone, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 20 }
  validates :medical_conditions, presence: true
end

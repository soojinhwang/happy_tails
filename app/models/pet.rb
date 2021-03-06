class Pet < ApplicationRecord
  belongs_to :shelter
  has_many :applications
  has_many_attached :photos

  include PgSearch::Model
  pg_search_scope :search_by_name_and_species,
    against: [ :name, :species, :breed, :sex, :colour, :description, :medical_conditions ],
    using: {
      tsearch: { prefix: true }
    }

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
  validates :other_cats, inclusion: { in: [true, false] }
  validates :other_dogs, inclusion: { in: [true, false] }
  validates :children, inclusion: { in: [true, false] }
  validates :hours_alone, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 20 }
  validates :medical_conditions, presence: true
end

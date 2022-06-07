class Application < ApplicationRecord
  belongs_to :user
  belongs_to :pet

  validates :date, presence: true
  validates :approved, inclusion: { in: [true, false] }
  validates :user_id, presence: true
  validates :pet_id, presence: true
end

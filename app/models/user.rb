class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :pets, through: :shelters
  has_one :shelter, dependent: :destroy

  validates :email, presence: true
  validates :password, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :age, presence: true, numericality: { only_integer: true }
  validates :shelter, inclusion: { in: [true, false],
                                   message: "%{value} is not a valid option" }
  validates :biography, presence: true, length: { minimum: 10 }
  validates :type_of_dwelling, inclusion: { in: %w(House Flat),
                                            message: "%{value} is not a valid type of dwelling" }
  validates  :outdoor_space, inclusion: { in: [true, false],
                                          message: "%{value} is not a valid option" }
  validates  :hours_alone, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 24 }
  validates  :other_pets, presence: true
  validates  :children, presence: true
  validates  :previous_experience, presence: true, length: { minimum: 10 }
end

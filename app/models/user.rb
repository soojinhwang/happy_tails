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
  validates :age, numericality: { only_integer: true }
  validates :biography, length: { minimum: 10 }
  validates :type_of_dwelling, inclusion: { in: %w(House Flat Farm),
                                            message: "%{value} is not a valid type of dwelling" }
  validates  :outdoor_space, inclusion: { in: [true, false],
                                          message: "%{value} is not a valid option" }
  validates  :hours_alone, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 24 }
  validates  :previous_experience, length: { minimum: 10 }
end

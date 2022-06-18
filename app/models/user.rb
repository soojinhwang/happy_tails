class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :pets, through: :shelters
  has_one :shelter, dependent: :destroy
  has_many :applications
  has_one_attached :photo
  has_many :messages, dependent: :destroy
  has_many :conversations, through: :messages, dependent: :destroy

  validates :email, presence: true
  validates :password, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  validates :age, numericality: { only_integer: true }, unless: ->(x) { x.age.blank? }
  validates :biography, length: { minimum: 10 }, unless: ->(x) { x.biography.blank? }
  validates :type_of_dwelling, inclusion: { in: %w(House Flat Farm),
                                            message: "%{value} is not a valid type of dwelling" },
                               unless: ->(x) { x.type_of_dwelling.blank? }
  validates :outdoor_space, inclusion: { in: [true, false],
                                         message: "%{value} is not a valid option" },
                            unless: ->(x) { x.outdoor_space.blank? }
  validates  :hours_alone, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 24 },
                           unless: ->(x) { x.hours_alone.blank? }
  validates  :previous_experience, length: { minimum: 10 }, unless: ->(x) { x.previous_experience.blank? }
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :dni, presence: true, uniqueness: true, numericality: { only_integer: true }
  has_many :aircrafts, dependent: :destroy
  has_many :bookings, dependent: :destroy
end

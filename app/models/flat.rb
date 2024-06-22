class Flat < ApplicationRecord
  has_many :bookings
  # has_many :reviews, dependent: :destroy
  has_many :users, through: :bookings

  validates :title, presence: true
  validates :address, presence: true, length: { minimum: 10}
  validates :description, presence: true, length: { minimum: 10}
  # validates :photo, presence: true
  validates :price_per_night, presence: true
  validates :number_of_guests, presence: true
end

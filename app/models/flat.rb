class Flat < ApplicationRecord
  has_many :bookings
  has_one_attached :photo
  # has_many :reviews, dependent: :destroy
  # has_many :users, through: :bookings

  validates :title, :city, :country, :zip_code, :price_per_night, :number_of_guests, :address, :description, presence: true
  validates :photo, presence: true
end

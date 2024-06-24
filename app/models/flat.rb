class Flat < ApplicationRecord
  has_many :bookings
  has_many :users, through: :bookings
  has_many_attached :photos
  # has_many :reviews, dependent: :destroy

  validates :title, :city, :country, :zip_code, :price_per_night, :number_of_guests, :address, :description, presence: true
end

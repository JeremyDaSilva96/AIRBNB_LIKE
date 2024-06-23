class Flat < ApplicationRecord
  has_many :bookings
  # has_many :reviews, dependent: :destroy
  # has_many :users, through: :bookings
  has_one_attached :photo

  validates :title, :city, :country, :zip_code, :price_per_night, :number_of_guests, :address, :description, :photo, presence: true
end

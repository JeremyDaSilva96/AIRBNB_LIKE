class Flat < ApplicationRecord
  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings
  # has_many :reviews, dependent: :destroy

  # cloudinary
  has_many_attached :photos

  # geocoding
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validates :title, :city, :country, :zip_code, :price_per_night, :number_of_guests, :address, :description, presence: true
end

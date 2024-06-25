class Booking < ApplicationRecord
  belongs_to :flat
  belongs_to :user

  validates :starts_at, :ends_at, :messages, presence: true
end

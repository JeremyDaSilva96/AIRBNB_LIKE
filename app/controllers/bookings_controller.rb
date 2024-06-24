class BookingsController < ApplicationController
  before_action :authenticate_user!

  def index
    @bookings = current_user.bookings.includes(:flat)
    # @bookings = Booking.all
    # @bookings.flats
  end
end

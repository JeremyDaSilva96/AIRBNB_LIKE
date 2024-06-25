class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_flat, only: [:new, :create]
  before_action :set_booking, only: [:show, :destroy]

  def index
    @bookings = current_user.bookings.includes(:flat)
  end

  def show
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.flat = @flat
    if @booking.save
      redirect_to bookings_path, notice: 'Booking was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @booking.destroy
    redirect_to bookings_path, notice: 'Booking was successfully deleted.' , status: :see_other
  end

  private

  def set_flat
    @flat = Flat.find(params[:flat_id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:starts_at, :ends_at, :messages)
  end

end

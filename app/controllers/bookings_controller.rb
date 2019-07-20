class BookingsController < ApplicationController
  before_action :logged_in_user, only: [:create]

  def index
    @booking = current_user.bookings.all
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
  end

  private
  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :guest_name)
  end

end
class BookingsController < ApplicationController
  before_action :logged_in_user, only: [:create]
  def index
    @booking = Booking.all
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to '/booking'
      flash[:success] = "New Reservation created!"
    else
      render 'new'
    end
  end

  private
  def booking_params
    params.require(:booking).permit(:start_date).permit(:end_date).permit(:guest_name)
  end

end
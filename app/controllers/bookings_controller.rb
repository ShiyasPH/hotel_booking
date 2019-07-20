class BookingsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update, :destroy, :index, :show]

  def index
    @booking = current_user.bookings.all
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = current_user.bookings.build(booking_params)
    if @booking.save
      redirect_to '/bookings'
      flash[:success] = "New Reservation Created!"
    else
      redirect_to hotels_path
    end
  end

  private
  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :guest_name)
  end

end
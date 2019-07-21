class BookingsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update, :destroy, :index, :show]

  def index
    @booking = current_user.bookings.all
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = current_user.bookings.create(booking_params)
    if @booking.save
      redirect_to "/hotels"
      flash[:success] = "Choose your hotel"
    else
      #render "new"
      redirect_to "/hotels"
    end
  end

  private

    def booking_params
      params.require(:booking).permit(:start_date, :end_date, :guest_name, :room_type)
    end
end
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
      redirect_to hotels_path
      flash[:success] = "Choose your hotel"
    else
      render "new"
    end
  end

  def show
    @booking = Booking.find params[:id]
    allhotels = Hotel.all
    allhotels.each do |hotel|
      if hotel.id == @booking.hotel_id
        @hotel = hotel
      end
    end
  end

  private

    def booking_params
      params.require(:booking).permit(:start_date, :end_date, :guest_name, :room_type)
    end
end
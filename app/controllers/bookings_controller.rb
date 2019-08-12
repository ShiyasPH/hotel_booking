class BookingsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update, :destroy, :index, :show]

  def index
    @booking = current_user.bookings.all
    @purpose = params[:purpose]
  end

  def new
    @booking = Booking.new
    @hotel = Hotel.find params[:hotel_id]
    @booking.start_date = params[:start_date]
    @booking.end_date = params[:end_date]
    @booking.room_type = params[:room_type]
    # Searching availability of rooms
    rooms = @hotel.rooms.where(room_type: @booking.room_type)
    rooms.each do |room|
      if room.bookings.where.not('bookings.end_date<? OR bookings.start_date>?', @booking.start_date, @booking. end_date).count == 0
        @roomforbooking = room
        break
      end
    end
  end

  def create
    @booking = current_user.bookings.build(booking_params)
    if @booking.save
      flash[:success] = "New Reservation Created!"
      redirect_to(hotels_path)
    else
      redirect_to(new_booking_path)
    end
  end

  def destroy
    Booking.find(params[:id]).destroy
    redirect_back fallback_location: bookings_path
  end

  private

    def booking_params
      params.require(:booking).permit(:start_date, :end_date, :guest_name, :room_id, :room_type)
    end
end
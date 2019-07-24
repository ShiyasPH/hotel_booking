class BookingsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update, :destroy, :index, :show]

  def index
    @booking = current_user.bookings.all
  end

  def new
    @booking = Booking.new
    @hotel = Hotel.find params[:hotel_id]
    @booking.start_date = params[:start_date]
    @booking.end_date = params[:end_date]
    @booking.room_type = params[:room_type]

    @rooms=@hotel.rooms.all
    @hotelbookings = @hotel.bookings.all
    @rooms.each do |room|
      if @booking.room_type == room.room_type
        flag = true
        @hotelbookings.each do |hb|
          if hb.room_id == room.id
            if @booking.start_date.between?(hb.start_date,hb.end_date) || @booking.end_date.between?(hb.start_date,hb.end_date)
              flag = false
              break
            end
          end
        end
        if flag == true
          @roomforbooking = room
          break
        end
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
    #flash[:success] = "Booking cancelled"
    #redirect_to users_url
  end

  private

    def booking_params
      params.require(:booking).permit(:start_date, :end_date, :guest_name, :room_id, :room_type)
    end
end
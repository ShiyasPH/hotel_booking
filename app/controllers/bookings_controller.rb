class BookingsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update, :destroy, :index, :show]

  def index
    @booking = current_user.bookings.all
  end

  def new
    @booking = Booking.new
    @hotel = Hotel.find params[:id]
    @booking.hotel_id = @hotel.id
    
=begin
    @room=hotel.rooms.all
    @hotelbookings = hotel.bookings.all
    @hotelbookings.each do |hb|
      if hb.room_type == @room_type
        hbsd = hb.start_date
        hbed = hb.end_date
        if @start_date.between?(hbsd,hbed) || @end_date.between?(hbsd,hbed)
          
        end
      end
    end
=end
  end

  def create
    @booking = current_user.bookings.build(booking_params)
    if @booking.save
      flash[:success] = "New Reservation Created!"
      redirect_to(hotels_path)
    else
      render 'new'
    end
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    redirect_to @user
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

  def destroy
    Booking.find(params[:id]).destroy
    #flash[:success] = "Booking cancelled"
    #redirect_to users_url
  end

  private

    def booking_params
      params.require(:booking).permit(:start_date, :end_date, :guest_name, :room_type)
    end
end
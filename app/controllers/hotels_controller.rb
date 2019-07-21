class HotelsController < ApplicationController
  def index
    allhotels = Hotel.all
    @availableid = Set.new
    current_booking = Booking.last    #error
    #@cb = current_booking
    allhotels.each do |hotel|
      @count = 10
      type = current_booking.room_type
      startdate = current_booking.start_date
      enddate = current_booking.end_date
      hotelbooking = hotel.bookings.all
      hotelbooking.each do |hb|
        if hb.room_type == type
          hbsd = hb.start_date
          hbed = hb.end_date
          if startdate.between?(hbsd,hbed) || enddate.between?(hbsd,hbed)
            @count-=1
          end
        end
      end
      if @count > 0
        @availableid.add(hotel)
      end
    end
    @availableid = @availableid.to_a
  end

  def show
    @hotel = Hotel.find params[:id]
  end
end
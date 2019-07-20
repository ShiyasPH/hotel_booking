class HotelsController < ApplicationController
  def index
    allhotels = Hotel.all
    @availableid = Set[]
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
            @count--
          end
        end
      end
      if count > 0
        @availableid.add(hotel.id)
    end
  end

  def show
    @hotel = Hotel.find params[:id]
  end
end
class HotelsController < ApplicationController
  def index
    @start_date = params[:booking] ? params[:booking][:start_date] : Date.today
    @end_date = params[:booking] ? params[:booking][:end_date] : Date.today
    @room_type = params[:booking] ? params[:booking][:room_type] : "Single room"
    debugger;
    #@availablehotels = Hotel.distinct.joins(:bookings).where('bookings.end_date < ? OR bookings.start_date > ?', @start_date, @end_date).where(bookings: {room_type: @room_type})
    allhotels = Hotel.all
    @availablehotels = Set.new
    allhotels.each do |hotel|
      count = 10
      hotelbookings = hotel.bookings.all
      hotelbookings.each do |hb|
        if hb.room_type == @room_type
          hbsd = hb.start_date
          hbed = hb.end_date
          if @start_date.between?(hbsd,hbed) || @end_date.between?(hbsd,hbed)
            count-=1
          end
        end
      end
      if count > 0
        @availablehotels.add(hotel)
      end
    end
    @availablehotels = @availablehotels.to_a
  end

  def show
    @hotel = Hotel.find params[:id]
  end
end
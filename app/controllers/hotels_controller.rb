class HotelsController < ApplicationController
  def index
    @start_date = params[:booking] ? params[:booking][:start_date] : Date.today
    @end_date = params[:booking] ? params[:booking][:end_date] : Date.today
    @room_type = params[:booking] ? params[:booking][:room_type] : "Single room"
    @start_date = @start_date.to_date
    @end_date = @end_date.to_date
    #@availablehotels = Hotel.distinct.joins(:bookings).where('bookings.end_date < ? OR bookings.start_date > ?', @start_date, @end_date).where(bookings: {room_type: @room_type})
    allhotels = Hotel.all
    @availablehotels = Array.new
    allhotels.each do |hotel|
      @count = 0
      hotelbookings = hotel.bookings.all
      hotelbookings.each do |hb|
        if hb.room_type == @room_type
          if @start_date.between?(hb.start_date,hb.end_date) || @end_date.between?(hb.start_date,hb.end_date)
            @count +=1
          end
        end
      end
      if @count < 10
        @availablehotels.push(hotel)
      end
    end
  end
end
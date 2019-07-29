class HotelsController < ApplicationController
  def index
    @start_date = params[:booking] ? params[:booking][:start_date] : Date.today
    @end_date = params[:booking] ? params[:booking][:end_date] : Date.today
    @room_type = params[:booking] ? params[:booking][:room_type] : "Single room"
    @start_date = @start_date.to_date
    @end_date = @end_date.to_date
    allhotels = Hotel.all
    @availablehotels = Array.new
    return flash.now[:alert] = "Invalid date" if @start_date < Date.today || @end_date < @start_date
    allhotels.each do |hotel|
      totalroomscount = hotel.rooms.where(room_type: @room_type).count
      hotelbookings = hotel.bookings.all
      hotelbookings.each do |hb|
        if hb.room_type == @room_type
          if @start_date.between?(hb.start_date,hb.end_date) || @end_date.between?(hb.start_date,hb.end_date)
            totalroomscount -=1
          end
        end
      end
      if totalroomscount > 0
        @availablehotels.push(hotel)
      end
    end
  end
end
class HotelsController < ApplicationController
  def index
    @start_date = params[:booking] ? params[:booking][:start_date] : Date.today
    @end_date = params[:booking] ? params[:booking][:end_date] : Date.today
    @room_type = params[:booking] ? params[:booking][:room_type] : "Single room"
    @start_date = @start_date.to_date
    @end_date = @end_date.to_date
    return flash.now[:alert] = "Invalid dates" if @start_date < Date.today || @end_date < @start_date
    # Searching availability of hotels
    allhotels = Hotel.all
    @availableHotels = Array.new
    allhotels.each do |hotel|
      availableRoomsCount = Hotel.where(id: hotel.id).joins(:rooms).where(rooms: {room_type: @room_type}).count - Hotel.where(id: hotel.id).joins(:bookings).where(bookings: {room_type: @room_type}).where.not('bookings.end_date<? OR bookings.start_date>?', @start_date, @end_date).count
      if availableRoomsCount > 0
        @availableHotels.push(hotel)
      end
    end
  end
end
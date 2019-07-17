class StaticPagesController < ApplicationController
  def home
  end
  def new_reservation
      @booking  = current_user.bookings.new
  end
end

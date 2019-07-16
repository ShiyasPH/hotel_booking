class BookingsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def create
    @bookings = current_user.bookings.build(bookings_params)
    if @bookings.save
      flash[:success] = "New Reservation created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

end
class BookingsController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:new, :create]
  def new
    @booking = Booking.new
    @date = session[:date]
    @place = session[:place]
    @city = City.find_by(id: @place['city_id'])
  end

  def create
    raise
   @booking = Booking.new(booking_params)
   @booking.date = session[:date]
   @booking.place_id = session[:place]['id']
   @booking.state = 'booked'
   @booking.public = false
   @booking.user = current_user
   if @booking.save
    session[:date] = nil
    session[:place] = nil
    redirect_to bookings_path
  end

  end

  def show
    @booking = Booking.find(params[:id])
  end

  def index
    @bookings = Booking.all
  end

  def update
  end

  def destroy
  end

  def edit
  end

  private

  def booking_params
    params.require(:booking).permit(:name, :description)
  end
end

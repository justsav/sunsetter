class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.find(params[:booking_id])
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
  end
end

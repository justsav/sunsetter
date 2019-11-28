class BookingsController < ApplicationController

  def index
    @user = current_user
    @bookings = Booking.all.where(user_id: current_user).order(date: :asc)
    @upcoming_bookings = @bookings.where('date > ?', Date.today)
    @booking_today = @bookings.where(date: Date.today)[0]

  end

  def new
    @user = current_user
    @date = session[:date]
    if @user.bookings.exists?(date: @date)
      redirect_to place_path(session[:place]['id'])
      flash[:notice] = "You have already booked a sunset for this date!"
    end
    @booking = Booking.new
    @place = session[:place]
    @city = City.find_by(id: @place['city_id'])


  end

  def create
   @booking = Booking.new(booking_params)
   @booking.date = session[:date]
   @booking.place_id = session[:place]['id']
   @booking.public = false
   @booking.user = current_user

   if @booking.save!
    session[:date] = nil
    session[:place] = nil
    redirect_to bookings_path
    flash[:notice] = "You've booked a sunset at #{@booking.place.name} on #{@booking.date}"
  else
    redirect_to sunsets_path
    flash[:notice] = "You already have a sunset booked for this date!"
  end

  end

  def show
    @booking = Booking.find(params[:id])
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

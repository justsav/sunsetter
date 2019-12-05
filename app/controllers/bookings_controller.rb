class BookingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  before_action :set_booking, only: :show

  def index
    @user = current_user
    @bookings = Booking.all.where(user_id: current_user).order(date: :asc)
    @upcoming_bookings = @bookings.where('date > ?', Date.today)
    @booking_today = @bookings.where(date: Date.today)[0]
    @past_bookings = @bookings.where('date < ?', Date.today)
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
    @sunset = Sunset.where(date: @date, city: @city)[0]
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
    @place = @booking.place.name
    @name = @booking.user.first_name.capitalize
    @city = @booking.place.city
    @date = @booking.date
    # @booking_id = @booking.id
    @sunset = Sunset.where(date: @date, city: @city)[0]
    # @number = params[:number]

      # raise
      # @send_message = SendMessage.new(@name, @date, @place, @number, @booking.id)
      # @send_message.send
      # # @send_message.number = ''
      # @number = nil

      # sleep 3



    #params[:number] = nil

    @guest = Guest.new
  end

  def send_msg
    @booking = Booking.find(params[:booking_id])
    @name = @booking.user.first_name.capitalize
    @date = @booking.date
    @place = @booking.place.name
    puts params
    @number = params[:number]
    @booking_id = @booking.id
    @send_message = SendMessage.new(@name, @date, @place, @number, @booking.id)
    @send_message.send

    redirect_to booking_path(@booking, nr: @number)
    flash[:notice] = "Your invitation has been sent to #{@number}"
    # @send_message.number = ''
  end

  def update
  end

  def destroy
  end

  def edit
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:name, :description)
  end
end

class GuestsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create]

  def new
    @guest = Guest.new
  end

  def create
    @booking = Booking.find(params[:booking_id])
    @guest = Guest.new(guest_params)
    @guest.booking = @booking
    # how to get from asset pipeline?
    @guest.image = 'https://image.flaticon.com/icons/svg/1940/1940935.svg'
    if @guest.save!
      respond_to do |format|
        format.html { redirect_to booking_path(@booking) }
        format.js # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'bookings/show' }
        format.js # <-- idem
      end
    end
  end

  private

  def guest_params
    params.require(:guest).permit(:name)
  end
end
# start

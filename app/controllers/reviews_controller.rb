class ReviewsController < ApplicationController
  before_action :find_booking, only: [:index, :new, :create]
  def index
    @reviews = Review.where(booking: @booking)
  end

  def show
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.booking = @booking
    @review.user = current_user
    place_name = @booking.place.name

   if @review.save
    redirect_to bookings_path
    flash[:notice] = "Thanks for adding your review to #{place_name}."
  else
    redirect_to bookings_path
    flash[:notice] = "Sorry, we couldn't add your review"
   end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content, :image)
  end

  def find_booking
    @booking = Booking.find(params[:booking_id])
  end
end

class ReviewsController < ApplicationController
  def index
    raise
    @booking = Booking.find(params[:booking_id])
    @reviews = Review.where(booking: @booking)
  end

  def show
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end

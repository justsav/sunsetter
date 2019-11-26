class ReviewsController < ApplicationController
  before_action :find_booking, only: [:index, :new, :create]
  def index
    raise
    @reviews = Review.where(booking: @booking)
  end

  def show
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
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

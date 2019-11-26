class PlacesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    store_session
    @city = City.find(params[:city_id])
    @places = Place.where(city: @city)
  end

  def show
    @place = Place.find(params[:id])
    @date = session[:date]
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def store_session
    session[:date] = params[:date_session]
  end
end

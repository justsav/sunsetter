class PlacesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    store_session_date
    @city = City.find(params[:city_id])
    @places = Place.where(city: @city)
    @date = session[:date]
    @geocoded_places = Place.geocoded
    @markers = @geocoded_places.map do |place|
      {
        lat: place.latitude,
        lng: place.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { place: place })
      }
    end
  end

  def show
    store_session_place
    if session[:date].nil?
      store_session_date
    end
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

  def store_session_date
    session[:date] = params[:date_session]
  end

  def store_session_place
    session[:place] = Place.find(params[:id])
  end
end

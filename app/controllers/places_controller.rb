class PlacesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def show
  end

  def index
    @city = City.find(params[:city_id])
    @places = Place.where(city: @city)
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
end

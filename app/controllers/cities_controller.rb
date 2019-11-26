class CitiesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @cities = City.all
  end

  def show
    @city = City.find(params[:id])
  end
end

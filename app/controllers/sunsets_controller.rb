class SunsetsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @sunsets = Sunset.all

    unless params[:city].empty?
      @city = City.find_by(name: params[:city].capitalize)
      @sunsets = @city.sunsets if @city
    end
  end


end

class SunsetsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  layout 'sunset'

  def index
    user_city = params[:city].capitalize
    if City.find_by(name: user_city).nil?
      redirect_to root_path
      flash[:notice] = "Sorry, we don't have any information for #{user_city} yet."
    end
    @sunsets = Sunset.all
    store_city

    unless params[:city].nil?
      @city = City.find_by(name: params[:city].capitalize)
      @sunsets = @city.sunsets if @city
    end
  end

  private

  def store_city
    session[:city] = params[:city]
  end
end

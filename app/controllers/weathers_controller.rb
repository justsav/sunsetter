class WeathersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
    @weathers = Weather.all
  end
end

class LocationsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create, :update]
  def new
    @locations = Location.all
  end

  def create
  end

  def update
  end
end

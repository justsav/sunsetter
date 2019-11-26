class SunsetsController < ApplicationController
skip_before_action :authenticate_user!, only: :index
  def index
    @sunsets = Sunset.all
  end
end

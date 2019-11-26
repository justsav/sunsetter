class SunsetsController < ApplicationController
  def index
    @sunsets = Sunset.all
  end
end

class AppController < ApplicationController

  def index
    @place = Place.first
  end

end

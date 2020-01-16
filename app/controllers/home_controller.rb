class HomeController < ApplicationController
  def index
    @power_stations = PowerStation.all
  end
end

class PowerStationController < ApplicationController

  def show
    @power_station = PowerStation.find(params[:id])
    @records = @power_station.daily_power_records
  end

  def create
    PowerStation.create!(name: params[:name])
    redirect_to root_path
  end
end

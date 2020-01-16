class PowerStationController < ApplicationController

  def show
    @power_station = PowerStation.find(params[:id])
    @records = @power_station.daily_power_records
  end

  def create
    begin
      PowerStation.create!(name: power_station_params)
      flash[:success] = "La station photovoltaique est créée !"
    rescue StandardError => e
      flash[:error] = e.message
    end

    redirect_to root_path
  end

  private

  def power_station_params
    params.require(:name)
  end
end

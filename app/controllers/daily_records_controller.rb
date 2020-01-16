class DailyRecordsController < ApplicationController
  def show
    @power_station = PowerStation.find(params[:power_station_id])
    date = params[:date]
    @records = @power_station.solar_inverter_records.where(date: date).group(:datetime).sum(:energy)
  end
end

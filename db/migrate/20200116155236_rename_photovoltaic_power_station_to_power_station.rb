class RenamePhotovoltaicPowerStationToPowerStation < ActiveRecord::Migration[6.0]
  def change
    rename_table :photovoltaic_power_stations, :power_stations
    rename_column :daily_power_records, :photovoltaic_power_station_id, :power_station_id
    rename_column :solar_inverter_records, :photovoltaic_power_station_id, :power_station_id
  end
end

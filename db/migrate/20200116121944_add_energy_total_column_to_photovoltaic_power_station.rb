class AddEnergyTotalColumnToPhotovoltaicPowerStation < ActiveRecord::Migration[6.0]
  def change
    add_column :photovoltaic_power_stations, :energy_total, :float
  end
end

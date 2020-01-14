class CreatePhotovoltaicPowerStations < ActiveRecord::Migration[6.0]
  def change
    create_table :photovoltaic_power_stations do |t|
      t.string :name

      t.timestamps
    end
  end
end

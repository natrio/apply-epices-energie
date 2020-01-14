class CreateSolarInverterRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :solar_inverter_records do |t|
      t.string :ref
      t.datetime :datetime
      t.float :energy
      t.references :photovoltaic_power_station, null: false, foreign_key: true

      t.timestamps
    end
  end
end

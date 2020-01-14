class CreateDailyPowerRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :daily_power_records do |t|
      t.date :date
      t.float :energy
      t.references :photovoltaic_power_station, null: false, foreign_key: true

      t.timestamps
    end
  end
end

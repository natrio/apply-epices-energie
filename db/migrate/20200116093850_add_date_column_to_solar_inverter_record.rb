class AddDateColumnToSolarInverterRecord < ActiveRecord::Migration[6.0]
  def change
    add_column :solar_inverter_records, :date, :date
  end
end

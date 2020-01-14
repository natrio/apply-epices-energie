require 'csv'

class ImportJob < ApplicationJob
  queue_as :default

  # args[0]: CSV source file
  # args[1]: PowerStation object to link to
  #
  def perform(*args)

    power_station = args[1]
    records = []
    CSV.foreach(args[0], "r", {headers: true, col_sep: ','}) do |row|
      records << {ref: row['identifier'], datetime: row['datetime'], energy: row['energy'], :photovoltaic_power_station_id => power_station.id}
    end

    SolarInverterRecord.import(records)
    SolarInverterRecord.remove_duplicate

  end
end

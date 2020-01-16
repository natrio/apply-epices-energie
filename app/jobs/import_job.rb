require 'csv'

class ImportJob < ApplicationJob
  queue_as :default

  # args[0]: CSV source file
  # args[1]: PowerStation object to link to
  #
  def perform(*args)

    power_station = args[1]
    records = []
    file = args[0]
    CSV.foreach(file, "r", {headers: true, col_sep: ','}) do |row|
      datetime = DateTime.strptime(row['datetime'], '%d/%m/%y %H:%M')
      records << {
          ref: row['identifier'],
          datetime: datetime.to_s,
          date: datetime.to_date.to_s,
          energy: row['energy'],
          power_station_id: power_station.id
      }
    end

    SolarInverterRecord.import(records)
    SolarInverterRecord.remove_duplicate

    File.delete(file) if File.exist?(file)
  end
end

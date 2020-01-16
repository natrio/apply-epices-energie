class ConsolidateJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later*
    SolarInverterRecord.dates_to_consolidate.each do |date_to_consolidate|
      DailyPowerRecord.create!(
          date: date_to_consolidate.date,
          energy: SolarInverterRecord.all_by_date(date_to_consolidate.date).all.sum(:energy),
          power_station_id: date_to_consolidate.power_station_id
      )
    end

  end
end

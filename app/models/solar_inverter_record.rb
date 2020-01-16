class SolarInverterRecord < ApplicationRecord
  belongs_to :power_station, :optional => false

  validates :ref, :datetime, :energy, presence: true


  scope :dates_to_consolidate, -> { self.where("date NOT IN (?)", DailyPowerRecord.select(:date)).group(:date) }
  scope :all_by_date, -> (date) { self.where(date: date) }

  def self.remove_duplicate
    loop do
      duplicate = SolarInverterRecord.select("MAX(id) as id")
                      .group(:datetime, :ref, :energy, :photovoltaic_power_station_id)
                      .having('count("id") > 1')
                      .collect(&:id)
      break if duplicate.blank?
      SolarInverterRecord.where(id: duplicate).delete_all
    end
  end

end

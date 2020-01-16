class DailyPowerRecord < ApplicationRecord
  belongs_to :power_station, :optional => false

  validates :date, :energy, presence: true

  after_commit :update_power_station_total_energy

  def update_power_station_total_energy
    self.power_station.consolidate
  end

end

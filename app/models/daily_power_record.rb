class DailyPowerRecord < ApplicationRecord
  belongs_to :photovoltaic_power_station, :optional => false

  validates :date, :energy, presence: true

end

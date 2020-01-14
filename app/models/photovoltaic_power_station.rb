class PhotovoltaicPowerStation < ApplicationRecord
  has_many :solar_inverter_records
  has_many :daily_power_records

  validates :name, presence: true

end

class PowerStation < ApplicationRecord
  has_many :solar_inverter_records
  has_many :daily_power_records

  validates :name, presence: true

  def consolidate
    self.energy_total = daily_power_records.sum(:energy)
    save!
  end

  def energy_on date
    daily_power_records.where(date: date).sum(:energy) unless daily_power_records.blank?
  end

  def energy_on_last_day
    daily_power_records.order(date: :desc).first.energy unless daily_power_records.blank?
  end

end

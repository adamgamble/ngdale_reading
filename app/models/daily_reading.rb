class DailyReading < ActiveRecord::Base

  def self.appropriate_reading
    @daily_reading = DailyReading.where(:date => Time.zone.now.to_date).first
    @daily_reading = DailyReading.first unless @daily_reading
    @daily_reading
  end
end

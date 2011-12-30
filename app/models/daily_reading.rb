class DailyReading < ActiveRecord::Base

  def appropriate_reading
    @daily_reading = DailyReading.where(:date => Date.today)
    @daily_reading = DailyReading.first unless @daily_reading
    @daily_reading
  end
end

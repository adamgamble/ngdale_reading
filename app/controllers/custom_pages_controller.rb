class CustomPagesController < ApplicationController
  def home
    if params["date"]
      @daily_reading = DailyReading.where(:date => Time.zone.parse(params["date"]).to_date).first
    else
      @daily_reading = DailyReading.appropriate_reading
    end
  end
end

class CustomPagesController < ApplicationController
  def home
    @daily_reading = DailyReading.appropriate_reading
  end
end

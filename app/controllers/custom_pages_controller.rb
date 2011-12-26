class CustomPagesController < ApplicationController
  def home
    @daily_reading = DailyReading.first
  end
end

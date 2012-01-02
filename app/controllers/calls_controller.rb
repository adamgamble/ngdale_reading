class CallsController < ApplicationController
  def create
    @daily_reading = DailyReading.appropriate_reading
    response = Twilio::TwiML::Response.new do |r|
      r.Say 'Welcome to the North Gardendale Bible Reading Hotline.', :voice => 'woman', :language => "en-gb"
      r.Say "Today's verses are #{@daily_reading.daily_reading.gsub("-"," through ")}. The Weekly Verses are #{@daily_reading.weekly_reading.gsub("-"," through ")}. The Monthly Verses are #{@daily_reading.monthly_reading.gsub("-"," through ")}.", :voice => 'woman', :loop => 5, :language => "en-gb"
    end

    render :text => response.text
  end
end

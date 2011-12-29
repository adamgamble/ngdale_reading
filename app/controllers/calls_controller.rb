class CallsController < ApplicationController
  def create
    @daily_reading = DailyReading.first
    response = Twilio::TwiML::Response.new do |r|
      r.Say 'Welcome to the North Gardendale Bible Reading Hotline', :voice => 'woman'
      r.Say "Today's verses are #{@daily_reading.daily_reading}", :voice => 'woman'
    end

    render :text => response.text
  end
end
